import 'package:app/bloc/jobs_bloc.dart';
import 'package:app/components/error.dart';
import 'package:app/components/loading.dart';
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
    return StreamBuilder<Response>(
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
        //TODO: empty list
        return ListView.builder(
          itemBuilder: (_, index) => JobListItem(
            index: index,
            type: type,
          ),
          itemCount: 10,
        );
      },
    );
  }
}
