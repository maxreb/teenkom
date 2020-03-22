import 'dart:async';

import 'package:app/networking/response.dart';
import 'package:rxdart/rxdart.dart';

class JobsBloc {
  Stream<Response> get jobs => _jobsSubject.stream;

  final _jobsSubject = BehaviorSubject<Response>();

  JobsBloc() {
    fetchJobs();
  }

  bool get notClosed => !_jobsSubject.isClosed;

  void fetchJobs() async {
    _jobsSubject.add(Response.loading('Lade Jobs...'));
    try {
      await Future.delayed(Duration(seconds: 1));
      if (notClosed) _jobsSubject.add(Response.completed([]));
//      chuckCategories jobs =
//      await _chuckRepository.fetchChuckCategoryData();
//      _jobsStreamController.add(Response.completed(jobs));
    } catch (e) {
      _jobsSubject.add(Response.error(e.toString()));
      print(e);
    }
  }

  void dispose() {
    _jobsSubject.close();
  }
}
