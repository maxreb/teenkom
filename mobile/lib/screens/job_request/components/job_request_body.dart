import 'package:app/components/job/components.dart';
import 'package:app/screens/job_accepted/job_accepeted_dialog.dart';
import 'package:app/screens/job_request/components/button_row.dart';
import 'package:flutter/material.dart';

class JobRequestBody extends StatefulWidget {
  @override
  _JobRequestBodyState createState() => _JobRequestBodyState();
}

class _JobRequestBodyState extends State<JobRequestBody>
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
    return Column(
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
    );
  }
}
