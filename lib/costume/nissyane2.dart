// ignore_for_file: library_private_types_in_public_api, duplicate_import, unused_field, unused_element, deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/app_style.dart';

import '../components/coustom_bottom_nav_bar.dart';
import '../enums.dart';



class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  late SharedPreferences _prefs;
  bool box1Checked = true;
  bool box2Checked = false;
  bool box3Checked = false;
  bool box4Checked = false;
  bool allBoxesChecked = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      box1Checked = _prefs.getBool('box1Checked') ?? false;
      box2Checked = _prefs.getBool('box2Checked') ?? false;
      box3Checked = _prefs.getBool('box3Checked') ?? false;
      box4Checked = _prefs.getBool('box4Checked') ?? false;
      allBoxesChecked =
          box1Checked && box2Checked && box3Checked && box4Checked;
    });
  }

  void _updatePrefs(String key, bool value) {
    _prefs.setBool(key, value);
  }

  void _resetPrefs() {
    _prefs.remove('box1Checked');
    _prefs.remove('box2Checked');
    _prefs.remove('box3Checked');
    _prefs.remove('box4Checked');
  }

  Future<bool> _isBoxLocked(int boxNumber) async {
    final boxKey = 'box${boxNumber - 1}Checked';
    final previousBoxChecked = _prefs.getBool(boxKey) ?? false;

    if (!previousBoxChecked) {
      return true;
    }

    final boxKeyLocked = 'box${boxNumber}Locked';
    final boxLockedDateTime = _prefs.getString(boxKeyLocked);

    if (boxLockedDateTime != null) {
      final lockedTime = DateTime.parse(boxLockedDateTime);
      final currentTime = DateTime.now();
      final difference = currentTime.difference(lockedTime);
      const hoursToUnlock = 24;

      return difference.inHours < hoursToUnlock;
    }

    return false;
  }

  Future<void> _openBox(int boxNumber) async {
    final boxKeyLocked = 'box${boxNumber}Locked';
    final currentTime = DateTime.now();
    final lockedTime = currentTime.toString();
    await _prefs.setString(boxKeyLocked, lockedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu:MenuState.home),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                logoImage,
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تمرين 02',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'أمامك النص التالي اقرأه جيدًا وحاول أن تحفظه في ذهنك.',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'قال الله تعالى:{فَبِظُلْمٍ مِنَ الَّذِينَ هَادُوا حَرَّمْنَا عَلَيْهِمْ طَيِّبَاتٍ أُحِلَّتْ لَهُمْ وَبِصَدِّهِمْ عَنْ سَبِيلِ اللَّهِ كَثِيرًا ۝ وَأَخْذِهِمُ الرِّبَا وَقَدْ نُهُوا عَنْهُ وَأَكْلِهِمْ أَمْوَالَ النَّاسِ بِالْبَاطِلِ وَأَعْتَدْنَا لِلْكَافِرِينَ مِنْهُمْ عَذَابًا أَلِيمًا ۝ لَكِنِ الرَّاسِخُونَ فِي الْعِلْمِ مِنْهُمْ وَالْمُؤْمِنُونَ يُؤْمِنُونَ بِمَا أُنْزِلَ إِلَيْكَ وَمَا أُنْزِلَ مِنْ قَبْلِكَ وَالْمُقِيمِينَ الصَّلَاةَ وَالْمُؤْتُونَ الزَّكَاةَ وَالْمُؤْمِنُونَ بِاللَّهِ وَالْيَوْمِ الْآخِرِ أُولَئِكَ سَنُؤْتِيهِمْ أَجْرًا عَظِيمًا} [النساء:160-162].',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            CheckboxListTile(
              title: const Text(
                'اليوم الأول: اقرأ الآية 15 مرة',
                style: TextStyle(color: Colors.black),
              ),
              value: box1Checked,
              onChanged: box1Checked
                  ? null
                  : (value) async {
                      setState(() {
                        box1Checked = value!;
                        _updatePrefs('box1Checked', value);
                        if (value) {
                          _openBox(1);
                        }
                        allBoxesChecked = box1Checked &&
                            box2Checked &&
                            box3Checked &&
                            box4Checked;
                      });
                      if (allBoxesChecked) {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('تهانينا!'),
                              content: const Text('لقد أكملت التمرين.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'feed');
                                  },
                                  child: const Text('التالي'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
            ),
            if (box1Checked)
              FutureBuilder<bool>(
                future: _isBoxLocked(2),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('حدث خطأ');
                  } else {
                    final isBoxLocked = snapshot.data ?? false;
                    if (isBoxLocked) {
                      return const Column(
                       children: [
                          Text(
                            'سيتم فتح الصندوق التالي بعد 24 ساعة',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          CheckboxListTile(
                            title: const Text(
                              'اليوم الثاني: اقرأ الآية 10 مرات',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: box2Checked,
                            onChanged: box2Checked
                                ? null
                                : (value) async {
                                    setState(() {
                                      box2Checked = value!;
                                      _updatePrefs('box2Checked', value);
                                      if (value) {
                                        _openBox(2);
                                      }
                                      allBoxesChecked = box1Checked &&
                                          box2Checked &&
                                          box3Checked &&
                                          box4Checked;
                                    });
                                    if (allBoxesChecked) {
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('تهانينا!'),
                                            content: const Text(
                                                'لقد أكملت التمرين.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, 'feed');
                                                },
                                                child: const Text('التالي'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                          ),
                          if (box2Checked)
                            FutureBuilder<bool>(
                              future: _isBoxLocked(3),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('حدث خطأ');
                                } else {
                                  final isBoxLocked = snapshot.data ?? false;
                                  if (isBoxLocked) {
                                    return  const Column(
                                      children: [
                                        Text(
                                          'سيتم فتح الصندوق التالي بعد 24 ساعة',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        CheckboxListTile(
                                          title: const Text(
                                            'اليوم الثالث: اقرأ الآية 7 مرات',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          value: box3Checked,
                                          onChanged: box3Checked
                                              ? null
                                              : (value) async {
                                                  setState(() {
                                                    box3Checked = value!;
                                                    _updatePrefs(
                                                        'box3Checked', value);
                                                    if (value) {
                                                      _openBox(3);
                                                    }
                                                    allBoxesChecked =
                                                        box1Checked &&
                                                            box2Checked &&
                                                            box3Checked &&
                                                            box4Checked;
                                                  });
                                                  if (allBoxesChecked) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'تهانينا!'),
                                                          content: const Text(
                                                              'لقد أكملت التمرين.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator
                                                                    .pushNamed(
                                                                        context,
                                                                        'feed');
                                                              },
                                                              child: const Text(
                                                                  'التالي'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                        ),
                                        if (box3Checked)
                                          FutureBuilder<bool>(
                                            future: _isBoxLocked(4),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const CircularProgressIndicator();
                                              } else if (snapshot.hasError) {
                                                return const Text('حدث خطأ');
                                              } else {
                                                final isBoxLocked =
                                                    snapshot.data ?? false;
                                                if (isBoxLocked) {
                                                  return const Column(
                                                    children: [
                                                      Text(
                                                        'سيتم فتح الصندوق التالي بعد 24 ساعة',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: 20),
                                                    ],
                                                  );
                                                } else {
                                                  return Column(
                                                    children: [
                                                      CheckboxListTile(
                                                        title: const Text(
                                                          'اليوم الرابع: اقرأ الآية 5 مرات',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        value: box4Checked,
                                                        onChanged: box4Checked
                                                            ? null
                                                            : (value) async {
                                                                setState(() {
                                                                  box4Checked =
                                                                      value!;
                                                                  _updatePrefs(
                                                                      'box4Checked',
                                                                      value);
                                                                  if (value) {
                                                                    _openBox(4);
                                                                  }
                                                                  allBoxesChecked = box1Checked &&
                                                                      box2Checked &&
                                                                      box3Checked &&
                                                                      box4Checked;
                                                                });
                                                                if (allBoxesChecked) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'تهانينا!'),
                                                                        content:
                                                                            const Text('لقد أكملت التمرين.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pushNamed(context, 'feed');
                                                                            },
                                                                            child:
                                                                                const Text('التالي'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              },
                                                      ),
                                                    ],
                                                  );
                                                }
                                              }
                                            },
                                          ),
                                      ],
                                    );
                                  }
                                }
                              },
                            ),
                        ],
                      );
                    }
                  }
                },
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('إعادة تعيين التمرين'),
                      content: const Text(
                          'هل أنت متأكد أنك تريد إعادة تعيين التمرين؟'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              box1Checked = false;
                              box2Checked = false;
                              box3Checked = false;
                              box4Checked = false;
                              allBoxesChecked = false;
                              _resetPrefs();
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('نعم'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('لا'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('إعادة التعيين'),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper functions

Future<bool> _isBoxLocked(int boxNumber) async {
  final prefs = await SharedPreferences.getInstance();
  final boxKey = 'box$boxNumber';
  var boxNumberLastOpenedTime;
  final lastOpenedTimeKey = 'box$boxNumberLastOpenedTime';

  if (!prefs.containsKey(boxKey)) {
    return true;
  }

  final lastOpenedTime = prefs.getInt(lastOpenedTimeKey);
  if (lastOpenedTime == null) {
    return false;
  }

  final currentTime = DateTime.now().millisecondsSinceEpoch;
  final difference = currentTime - lastOpenedTime;

  if (difference >= 24 * 60 * 60 * 1000) {
    return false;
  }

  return true;
}

void _openBox(int boxNumber) async {
  final prefs = await SharedPreferences.getInstance();
  final boxKey = 'box$boxNumber';
  var boxNumberLastOpenedTime;
  final lastOpenedTimeKey = 'box$boxNumberLastOpenedTime';

  if (prefs.containsKey(boxKey)) {
    return;
  }

  prefs.setBool(boxKey, true);
  prefs.setInt(lastOpenedTimeKey, DateTime.now().millisecondsSinceEpoch);
}

void _resetPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<bool> _getPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

Future<void> _updatePrefs(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}
