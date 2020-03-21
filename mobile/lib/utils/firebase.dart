import 'package:firebase_messaging/firebase_messaging.dart';

void initFirebaseMessaging() async {
  final firebaseMessaging = FirebaseMessaging();
  await firebaseMessaging.requestNotificationPermissions();

  String token = await firebaseMessaging.getToken();
  print(token);
  firebaseMessaging.configure(onLaunch: (arguments) {
    return null;
  });
}
