import 'dart:async';

import 'package:app/generated/client/jobs.pb.dart';
import 'package:app/networking/response.dart';
import 'package:app/repository/job_repository.dart';

class JobRequestBloc {
  final _jobRequestController = StreamController<Response<BlitzjobRes>>();
  final JobRepository _repository = JobRepository();
  final int id;

  Stream<Response<BlitzjobRes>> get stream => _jobRequestController.stream;

  JobRequestBloc(this.id, bool request) {
    if (request) fetchJob();
  }

  void fetchJob() async {
    _jobRequestController.add(Response.loading('Lade Anfrage'));
    try {
      final result = await _repository.getJobById(id);
      _jobRequestController.add(Response.completed(result));
    } catch (e) {
      _jobRequestController.add(Response.error(e.toString()));
    }
  }

  Future<Response<AcceptJobRes>> acceptJob() async {
    try {
      final result = await _repository.acceptJob(id);
      print(result);
      return Response.completed(result);
    } catch (e) {
      print(e.toString());
      return Response.error(e.toString());
    }
  }

  void dispose() {
    _jobRequestController.close();
  }
}
