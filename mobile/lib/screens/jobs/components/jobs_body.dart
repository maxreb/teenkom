import 'package:app/bloc/jobs_bloc.dart';
import 'package:app/components/error.dart';
import 'package:app/components/loading.dart';
import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/models/job_types.dart';
import 'package:app/networking/response.dart';
import 'package:app/screens/jobs/components/job_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobsBody extends StatelessWidget {
  final JobTypes type;

  const JobsBody({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<JobsBloc>(context);
    return StreamBuilder<Response<List<BlitzjobRes>>>(
      stream: bloc.jobs,
      initialData: Response.loading(''),
      builder: (context, snapshot) {
        if (snapshot.data.status == Status.LOADING) {
          return LoadingWidget();
        } else if (snapshot.data.status == Status.ERROR) {
          return ErrorRetryWidget(
            message: snapshot.data.message,
            onRetry: () {
              bloc.fetchJobs();
            },
          );
        }
        final data = snapshot.data.data.where(_filterJob).toList();
        if (data.isEmpty) {
          return Center(
            child: Text(
              _getEmptyDataText(),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () => bloc.updateJobs(),
          child: ListView.builder(
            itemBuilder: (_, index) => JobListItem(
              job: data[index],
              type: type,
            ),
            itemCount: data.length,
          ),
        );
      },
    );
  }

  String _getEmptyDataText() {
    if (type == JobTypes.completed) {
      return 'Du hast bisher keine Blitzjobs erledigt';
    } else if (type == JobTypes.request) {
      return 'Aktuell gibt es keine Blitzjobs für dich';
    } else {
      return 'Du hast gerade keine offenen Blitzjobs';
    }
  }

  bool _filterJob(BlitzjobRes job) {
    if (type == JobTypes.completed) {
      return job.status == 'Erledigt';
    } else if (type == JobTypes.request) {
      return job.status == 'Zugewiesen';
    } else {
      return job.status != 'Erledigt' && job.status != 'Zugewiesen';
    }
    return false;
  }
}
