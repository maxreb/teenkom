import 'dart:async';

import 'package:app/models/job_types.dart';
import 'package:app/networking/response.dart';

class JobsBloc {
  final JobTypes jobType;
  final _jobsStreamController = StreamController<Response>();

  Stream<Response> get jobs => _jobsStreamController.stream;

  JobsBloc(this.jobType);

  void _fetchJobs() async {
    _jobsStreamController.add(Response.loading('Getting Chuck Categories.'));
    try {
//      chuckCategories jobs =
//      await _chuckRepository.fetchChuckCategoryData();
//      _jobsStreamController.add(Response.completed(jobs));
    } catch (e) {
      _jobsStreamController.add(Response.error(e.toString()));
      print(e);
    }
  }

  void dispose() {
    _jobsStreamController.close();
  }
}
