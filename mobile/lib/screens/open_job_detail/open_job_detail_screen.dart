import 'package:app/bloc/job_request_bloc.dart';
import 'package:app/components/error.dart';
import 'package:app/components/job/components.dart';
import 'package:app/components/loading.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/networking/response.dart';
import 'package:app/screens/open_job_detail/components/job_awaiting_review.dart';
import 'package:flutter/material.dart';

class OpenJobDetailsScreen extends StatefulWidget {
  final BlitzjobRes job;
  final int id;

  const OpenJobDetailsScreen({Key key, this.job, this.id})
      : super(key: key);

  @override
  _OpenJobDetailsScreenState createState() => _OpenJobDetailsScreenState();
}

class _OpenJobDetailsScreenState extends State<OpenJobDetailsScreen> {
  JobRequestBloc bloc;

  @override
  void initState() {
    bloc = JobRequestBloc(widget.id, widget.job == null);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.job == null) {
      child = StreamBuilder<Response<BlitzjobRes>>(
        stream: bloc.stream,
        initialData: Response.loading('Lade'),
        builder: (context, snapshot) {
          if (snapshot.data.status == Status.LOADING) {
            return LoadingWidget();
          }
          if (snapshot.data.status == Status.ERROR) {
            return ErrorRetryWidget(onRetry: bloc.fetchJob);
          }
          return _getBody(snapshot.data.data);
        },
      );
    } else {
      child = _getBody(widget.job);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Offener Blitzjob'),
      ),
      body: child,
    );
  }

  Widget _getBody(BlitzjobRes job) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: <Widget>[
        JobTitle(showName: true, job: job),
        const SizedBox(height: 16),
        JobDetails(job: job),
        const SizedBox(height: 32),
        const JobCoach(),
        const SizedBox(height: 32),
       const JobAwaitingReview(),
      ],
    );
  }
}
