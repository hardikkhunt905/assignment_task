import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bloc_base_structure/Constants/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationService {
  //Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = "1";

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId, //channel ID
    "reminder", //channel name
    channelDescription: "This channel is responsible for all the local notifications",//channel description
    playSound: true,
    priority: Priority.high,
    importance: Importance.max,
        usesChronometer: true,
          sound: RawResourceAndroidNotificationSound("sound_galaxy"),
        enableVibration: true,

  );

  // Future<String> _downloadAndSaveFile(String url, String fileName) async {
  //   HttpService service = HttpService();
  //   final Directory directory = await getApplicationDocumentsDirectory();
  //   final String filePath = '${directory.path}/$fileName';
  //   final response = await service.getRequest(url);
  //   final File file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

  static final IOSNotificationDetails _iOSNotificationDetails =
      IOSNotificationDetails();

  final NotificationDetails notificationDetails = NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iOSNotificationDetails,
  );

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("app_logo");

    const IOSInitializationSettings iOSInitializationSettings =
        IOSInitializationSettings(
      defaultPresentAlert: false,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    // *** Initialize timezone here ***
    _configureLocalTimeZone();

    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification : onSelectNotification,
    );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    Debug.setLog("here timeZoneName -> $timeZoneName");
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<bool?> requestAndroidPermissions() async {
    final bool? granted = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    return granted;
  }

  Future<void> requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showNotification(
      int id, String title, String body, String payload) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }


  Future<void> scheduleNotification({required int id, required String title, required String body,
    required TimeOfDay timeOfDay,String payload = "",required int day}) async {

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
        _nextInstanceOfWeekday(timeOfDay.hour, timeOfDay.minute, day),
        // tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: payload,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
    );
  }

  //for weekday
  tz.TZDateTime _nextInstanceOfWeekday(int hour, int minute,int day) {
    tz.TZDateTime scheduledDate = _nextInstanceOfTenAM(hour,minute);
    while (scheduledDate.weekday != day) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }


  //for daily
  tz.TZDateTime _nextInstanceOfTenAM(int hour, int minute,) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour,minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }


  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<List<PendingNotificationRequest>> getPendingNotification() async {
    List<PendingNotificationRequest> pendingNotification = await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return pendingNotification;
  }

}

Future<void> onSelectNotification(String? payload) async {
  // await navigatorKey.currentState
  //     ?.push(MaterialPageRoute(builder: (_) => HomeScreen()));
}
