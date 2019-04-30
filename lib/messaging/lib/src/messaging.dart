import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

typedef OnEvent = Future<dynamic> Function(Map<String, dynamic>);

void requestPermission() async {
  print(await _firebaseMessaging.getToken());
  _firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings) {
    print("Settings registered: $settings");
  });
  _firebaseMessaging.requestNotificationPermissions();
}

void configure({OnEvent onLaunch, OnEvent onMessage, OnEvent onResume}) {
  _firebaseMessaging.configure(
    onLaunch: onLaunch,
    onResume: onResume,
    onMessage: (data) {
      print("data: $data");
    },
  );
}

void subscribeToTopic(String topic) {
  _firebaseMessaging.subscribeToTopic(topic);
}

void unsubscribeFromTopic(String topic) {
  _firebaseMessaging.unsubscribeFromTopic(topic);
}

Future<String> getToken() async => await _firebaseMessaging.getToken();

Stream<String> onTokenRefresh = _firebaseMessaging.onTokenRefresh;

moop() async {
  print(await _firebaseMessaging.getToken());
}
