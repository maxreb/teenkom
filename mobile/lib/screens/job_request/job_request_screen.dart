import 'package:app/components/job_details.dart';
import 'package:app/screens/job_request/components/button_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobRequestScreen extends StatefulWidget {
  final String id;

  const JobRequestScreen({Key key, this.id}) : super(key: key);

  @override
  _JobRequestScreenState createState() => _JobRequestScreenState();
}

class _JobRequestScreenState extends State<JobRequestScreen>
    with SingleTickerProviderStateMixin {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anfrage für eine Blitzjob'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          JobData(showDetails: _showDetails),
          Expanded(
            child: ButtonRow(
              stageOneCompleted: _showDetails,
              onContinue: () {
                setState(() => _showDetails = true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
