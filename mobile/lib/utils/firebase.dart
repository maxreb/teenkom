import 'package:firebase_messaging/firebase_messaging.dart';

void initFirebaseMessaging(
    Function(int id) onJobRequest, Function(int id) onReviewRequest) async {
  final firebaseMessaging = FirebaseMessaging();
  await firebaseMessaging.requestNotificationPermissions();

  String token = await firebaseMessaging.getToken();
  print(token);
  firebaseMessaging.configure(
    onLaunch: (arguments) async {
      _handleNotification(arguments, onJobRequest, onReviewRequest);
    },
    onMessage: (arguments) async {
      _handleNotification(arguments, onJobRequest, onReviewRequest);
    },
    onResume: (arguments) async {
      _handleNotification(arguments, onJobRequest, onReviewRequest);
    },
  );
  firebaseMessaging.subscribeToTopic('WirVsVirus_NewReviewRequest');
  firebaseMessaging.subscribeToTopic('WirVsVirus_NewAssignmentRequest');
}

void _handleNotification(
  Map arguments,
  Function(int id) onJobRequest,
  Function(int id) onReviewRequest,
) async {
  if (arguments != null && arguments['data'] != null) {
    switch (arguments['data']['topic']) {
      case 'NewAssignmentRequest':
        print(arguments);
        if (arguments['data']['jobId'] != null) {
          onJobRequest(int.parse(arguments['data']['jobId']));
        }
        break;
      case 'NewReviewRequest':
        if (arguments['data']['jobId'] != null) {
          onReviewRequest(int.parse(arguments['data']['jobId']));
        }
        break;
    }
    print(arguments);
  }
}
