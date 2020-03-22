import 'package:app/components/components.dart';
import 'package:app/components/job_details.dart';
import 'package:app/screens/job_accepted/job_accepeted_dialog.dart';
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
  AnimationController controller;
  Animation<double> _fadeInAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anfrage für eine Blitzjob'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          JobTitle(),
          SizedBox(height: 16),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: JobDetails(),
          ),
          Expanded(
            child: ButtonRow(
              stageOneCompleted: _showDetails,
              onContinue: () {
                if (!_showDetails) {
                  setState(() => _showDetails = true);
                  controller.forward();
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => JobAcceptedDialog(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
