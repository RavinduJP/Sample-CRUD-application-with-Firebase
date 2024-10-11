import 'package:firebase_messaging/firebase_messaging.dart';


  Future<void> initNotifications() async {
    await FirebaseMessaging.instance.requestPermission();

    final fmcToken = await FirebaseMessaging.instance.getToken();
    if (fmcToken != null) {
      // APNS token is available, make FCM plugin API requests...
      print('Token : $fmcToken');
    } else {
      print('Failed to get FCM Token');
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      print('token refreshed: $fcmToken');
    }).onError((err) {
      print('Error getting new token: $err');
    });
  }
