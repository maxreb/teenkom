import 'package:app/bloc/job_request_bloc.dart';
import 'package:app/components/job/components.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/screens/job_accepted/job_accepeted_dialog.dart';
import 'package:app/screens/job_request/components/button_row.dart';
import 'package:flutter/material.dart';

class JobRequestBody extends StatefulWidget {
  final BlitzjobRes job;
  final JobRequestBloc bloc;

  const JobRequestBody({Key key, this.job, this.bloc}) : super(key: key);

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
        JobTitle(job: widget.job),
        SizedBox(height: 16),
        FadeTransition(
          opacity: _fadeInAnimation,
          child: JobDetails(job: widget.job),
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
                  builder: (_) => JobAcceptedDialog(
                    bloc: widget.bloc,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
