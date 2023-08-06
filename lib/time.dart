// ignore_for_file: prefer_const_declarations, deprecated_member_use, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:app/app_style.dart';
import 'package:app/costume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  late TimeOfDay _selectedTime;

  String selectedTime = '';
  TextEditingController timeController = TextEditingController();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    initializeNotifications();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> initializeNotifications() async {
    WidgetsFlutterBinding.ensureInitialized();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
        const InitializationSettings(android: initializationSettingsAndroid);

    tz.initializeTimeZones();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> showNotification(String selectedTime) async {
    final DateTime now = DateTime.now();
    final tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'تذكير',
      'حان الوقت للتأمل!',
      scheduledDate,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'notification_payload',
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.035,
            ),
            child: Column(
              children: [
                Image.asset(
                  logoImage,
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: size.height * 0.023),
                Text(
                  "اختر الوقت الذي يناسبك للتأمل",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  "يمكن أن يساعد تحديد وقت تنظيمي للتأمل على تذكيرك لاحقًا",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = '09:00';
                          timeController.text = selectedTime;
                          _selectedTime = const TimeOfDay(hour: 9, minute: 0);
                        });
                      },
                      child: Container(
                        width: size.width * 0.25,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.withOpacity(0.8),
                              Colors.blue.withOpacity(0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '09:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = '12:00';
                          timeController.text = selectedTime;
                          _selectedTime = const TimeOfDay(hour: 12, minute: 0);
                        });
                      },
                      child: Container(
                        width: size.width * 0.25,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.withOpacity(0.8),
                              Colors.green.withOpacity(0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '12:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = '15:00';
                          timeController.text = selectedTime;
                          _selectedTime = const TimeOfDay(hour: 15, minute: 0);
                        });
                      },
                      child: Container(
                        width: size.width * 0.25,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.8),
                              Colors.orange.withOpacity(0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '15:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: const Text('حدد الوقت'),
                ),
                const SizedBox(height: 20),
                Text(
                  'الوقت المحدد: ${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    // Valid time is entered
                    showNotification(selectedTime);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const costume(),
                      ),
                    );
                  },
                  child: const Text('حفظ التنبيه'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
