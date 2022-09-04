import 'dart:async';
import 'dart:io';
import 'package:asshir/helper/core_classes/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart' as core;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalNotification {
  static Future<String> getFcmToken() async {
    String deviceToken = (await FirebaseMessaging.instance.getToken())!;
    CacheHelper.setDeviceToken(deviceToken);

    // String deviceToken = Prefs.getString("device_token");
    // if (deviceToken == "") {
    //   deviceToken = (await FirebaseMessaging.instance.getToken())!;
    //   // Prefs.setString("device_token", deviceToken);
    // }
    print('firebase token => $deviceToken');
    // SharedPreferences _prefs =await SharedPreferences.getInstance();
    // _prefs.setString("device_token", deviceToken);
    return deviceToken;
  }

  late FirebaseMessaging _firebaseMessaging;

  StreamController<Map<String, dynamic>> get notificationSubject {
    return _onMessageStreamController;
  }

  void killNotification() {
    _onMessageStreamController.close();
  }

  late FlutterLocalNotificationsPlugin _notificationsPlugin;

  late Map<String, dynamic> _not;

  Future<void> setUpFirebase() async {
    getFcmToken();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    core.Firebase.initializeApp();
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    // checkLastMessage();
    firebaseCloudMessagingListeners();

    _notificationsPlugin = FlutterLocalNotificationsPlugin();

    _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = const IOSInitializationSettings(
        defaultPresentBadge: true,
        defaultPresentAlert: true,
        defaultPresentSound: true);
    var initSetting = InitializationSettings(android: android, iOS: ios);
    _notificationsPlugin.initialize(initSetting, onSelectNotification: (v) {
      onSelectNotification(v ?? "");
    });
  }

  Future<void> firebaseCloudMessagingListeners() async {
    if (Platform.isIOS) iOSPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage data) {
      print('on message ${data.data}');
      print('on message notification body ${data.notification!.body}');
      print('on message notification title ${data.notification!.title}');
      _onMessageStreamController.add(data.data);

      _not = data.data;
      if (Platform.isAndroid) {
        showNotificationWithAttachment(
            data.data,
            data.notification!.title ?? "",
            data.notification!.body ?? "",
            data.notification!.android!.imageUrl ?? "");
      } else {
        showNotificationWithAttachment(
          data.data,
          data.notification!.title ?? "",
          data.notification!.body ?? "",
          data.notification!.apple!.imageUrl ?? "",
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage data) {
      print('on Opened ' + data.data.toString());

      handlePath(data.data);
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage data) {
    //   print('on message ' + data.data.toString());
    //
    //   handlePath(data.data);
    // });

    //onBackgroundMessage,onMessage
  }

  showNotification(
      Map<String, dynamic> _message, String title, String body) async {
    print("Notification Response : $_message");

    var androidt = const AndroidNotificationDetails(
        'channel_id', 'channel_name',
        channelDescription: 'channel_description',
        priority: Priority.high,
        channelShowBadge: true,
        playSound: true,
        ticker: 'ticker',
        icon: "@mipmap/ic_launcher",
        enableVibration: true,
        enableLights: true,
        importance: Importance.max);
    var iost = const IOSNotificationDetails();
    var platform = NotificationDetails(android: androidt, iOS: iost);
    await _notificationsPlugin.show(0, title, body, platform, payload: "");
  }

  Future<void> showNotificationWithAttachment(Map<String, dynamic> _message,
      String title, String body, String imageUrl) async {
    print("Notification Response : $_message");
    // var attachmentPicturePath =
    //     await _downloadAndSaveFile(imageUrl, 'attachment_img.jpg');
    var iOSPlatformSpecifics = const IOSNotificationDetails(
        // attachments: [IOSNotificationAttachment(attachmentPicturePath)],
        );
    // var bigPictureStyleInformation = BigPictureStyleInformation(
    //   FilePathAndroidBitmap(attachmentPicturePath),
    //   contentTitle: '<b>$title</b>',
    //   htmlFormatContentTitle: true,
    //   summaryText: '$body',
    //   htmlFormatSummaryText: true,
    // );
    var androidChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.high,
      priority: Priority.high,
      // styleInformation: bigPictureStyleInformation,
    );
    var notificationDetails = NotificationDetails(
        android: androidChannelSpecifics, iOS: iOSPlatformSpecifics);
    print("notificationDetails $notificationDetails");
    await _notificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  _downloadAndSaveFile(String url, String fileName) async {
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var response = await http.get(Uri.parse(url));
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  void iOSPermission() {
    _firebaseMessaging.requestPermission(
        alert: true, announcement: true, badge: true, sound: true);
  }

  void handlePath(Map<String, dynamic> dataMap) {
    handlePathByRoute(dataMap);
  }

  Future<void> handlePathByRoute(Map<String, dynamic> dataMap) async {
    String _type = dataMap["notify_type"].toString();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String? _userType = _pref.getString("userType");
    print("type =-=-=-=-=--= $_type");

    // push(navigator.currentContext, NotificationView());
  }

  Future<void> onSelectNotification(String payload) async {
    print(payload.toString());
    handlePath(_not);
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage data) async {
  // If you're going to use other Firebase services in the dat, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  // _onMessageStreamController.add(message.data);
  // if (Platform.isAndroid) {
  //   GlobalNotification().showNotificationWithAttachment(
  //       data.data,
  //       data.notification.title,
  //       data.notification.body,
  //       data.notification.android.imageUrl);
  // } else {
  //   GlobalNotification().showNotificationWithAttachment(
  //       data.data,
  //       data.notification.title,
  //       data.notification.body,
  //       data.notification.apple.imageUrl);
  // }
  print("Handling a background message: ${data.data}");
}

StreamController<Map<String, dynamic>> _onMessageStreamController =
    StreamController.broadcast();
