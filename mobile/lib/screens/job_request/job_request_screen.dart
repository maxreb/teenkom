import 'package:app/screens/job_request/components/job_request_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobRequestScreen extends StatelessWidget {
  final String id;

  const JobRequestScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anfrage für eine Blitzjob'),
      ),
      body: JobRequestBody(),
    );
  }
}
