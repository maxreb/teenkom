import 'package:app/bloc/job_request_bloc.dart';
import 'package:app/components/error.dart';
import 'package:app/components/loading.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/networking/response.dart';
import 'package:app/screens/job_request/components/job_request_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobRequestScreen extends StatefulWidget {
  final int id;
  final BlitzjobRes job;

  const JobRequestScreen({Key key, this.id, this.job})
      : assert(job != null || id != null),
        super(key: key);

  @override
  _JobRequestScreenState createState() => _JobRequestScreenState();
}

class _JobRequestScreenState extends State<JobRequestScreen> {
  JobRequestBloc bloc;

  @override
  void initState() {
    bloc = JobRequestBloc(widget.id ?? widget.job.jobId, widget.job == null);
    super.initState();
  }

  @override
  void dispose() {
    if (bloc != null) bloc.dispose();
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
          return JobRequestBody(
            job: snapshot.data.data,
            bloc: bloc,
          );
        },
      );
    } else {
      child = JobRequestBody(
        job: widget.job,
        bloc: bloc,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Anfrage für eine Blitzjob'),
      ),
      body: child,
    );
  }
}
