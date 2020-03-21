import 'package:firebase_messaging/firebase_messaging.dart';

void initFirebaseMessaging() async {
  final firebaseMessaging = FirebaseMessaging();
  await firebaseMessaging.requestNotificationPermissions();

  String token = await firebaseMessaging.getToken();
  print(token);
  firebaseMessaging.configure(
    onLaunch: (arguments) {
      print('test');
      return null;
    },
    onMessage: (arguments) {
      print('test');
      return null;
    },
    onResume: (arguments) {
      print('test');
      return null;
    },
  );
  firebaseMessaging.subscribeToTopic('NetCoreTest');
}
