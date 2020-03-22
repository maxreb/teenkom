import 'package:app/arguments/job_request_argument.dart';
import 'package:app/screens/job_request/job_request_screen.dart';
import 'package:app/screens/jobs/jobs_screen.dart';
import 'package:app/screens/open_job_detail/open_job_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/job_request':
      final JobRequestArgument argument = settings.arguments;
      return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => JobRequestScreen(id: argument.jobId),
      );
    default:
      return MaterialPageRoute(builder: (_) => JobsScreen());
  }
}
