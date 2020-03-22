import 'dart:async';

import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/networking/response.dart';
import 'package:app/repository/job_repository.dart';
import 'package:rxdart/rxdart.dart';

class JobsBloc {
  Stream<Response<List<BlitzjobRes>>> get jobs => _jobsSubject.stream;
  final JobRepository _repository = JobRepository();

  final _jobsSubject = BehaviorSubject<Response<List<BlitzjobRes>>>();

  JobsBloc() {
    fetchJobs();
  }

  bool get notClosed => !_jobsSubject.isClosed;

  Future<void> fetchJobs() async {
    _jobsSubject.add(Response.loading('Lade Jobs...'));
    try {
      var result = await _repository.getJobList();
      _jobsSubject.add(Response.completed(result));
    } catch (e) {
      _jobsSubject.add(Response.error(e.toString()));
      print(e);
    }
  }

  Future<void> updateJobs() async {
    try {
      var result = await _repository.getJobList();
      _jobsSubject.add(Response.completed(result));
    } catch (e) {
      print(e);
    }
  }


  void dispose() {
    _jobsSubject.close();
  }
}
