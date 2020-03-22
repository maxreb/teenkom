import 'package:app/arguments/job_request_argument.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

void initFirebaseMessaging(BuildContext context) async {
  final firebaseMessaging = FirebaseMessaging();
  await firebaseMessaging.requestNotificationPermissions();

  String token = await firebaseMessaging.getToken();
  print(token);
  firebaseMessaging.configure(
    onLaunch: (arguments) async {
      _handleNotification(arguments, context);
    },
    onMessage: (arguments) async {
      _handleNotification(arguments, context);
    },
    onResume: (arguments) async {
      _handleNotification(arguments, context);
    },
  );
  firebaseMessaging.subscribeToTopic('WirVsVirus_NewReviewRequest');
  firebaseMessaging.subscribeToTopic('WirVsVirus_NewAssignmentRequest');
}

void _handleNotification(Map arguments, BuildContext context) async {
  switch (arguments['data']['from']) {
    case '/topics/WirVsVirus_NewAssignmentRequest':
      print(arguments);
      print(arguments['data']['jobId']);
      if (arguments['data']['jobId'] != null) {
        await Future.delayed(Duration.zero);
        Navigator.pushNamed(
          context,
          '/job_request',
          arguments: JobRequestArgument(
            arguments['data']['jobId'],
          ),
        );
      }
      break;
    case '/topics/WirVsVirus_NewReviewRequest':
      break;
  }
  print(arguments);
}
