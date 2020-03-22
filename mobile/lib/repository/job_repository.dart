import 'dart:async';

import 'package:app/generated/client/jobs.pbgrpc.dart';
import 'package:app/generated/google/protobuf/empty.pb.dart';
import 'package:app/generated/shared/default.pb.dart';
import 'package:app/networking/api_provider.dart';
import 'package:app/networking/custom_exception.dart';
import 'package:grpc/grpc.dart';

class JobRepository {
  JobsClient _client;
  final ApiProvider provider = ApiProvider();

  JobRepository() {
    _client = JobsClient(provider.channel);
  }

  Future<List<BlitzjobRes>> getJobList() async {
    try {
      final response = await _client.list(Empty());
      return response.blitzjobs;
    } on GrpcError catch (e) {
      print(e);
      print(e.code);
      throw FetchDataException('');
    }
  }

  Future<BlitzjobRes> getJobById(int id) async {
    try {
      return await _client.get(DefaultReq()..id = id);
    } on GrpcError catch (e) {
      print(e);
      throw FetchDataException('');
    }
  }

  Future<AcceptJobRes> acceptJob(int id) async {
    try {
      return await _client.acceptJobReq(DefaultReq()..id = id);
    } on GrpcError catch (e) {
      print(e);
      throw FetchDataException('');
    }
  }
}
