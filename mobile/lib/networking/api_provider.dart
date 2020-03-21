import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/generated/protos/greeter.pbgrpc.dart';
import 'package:app/networking/custom_exception.dart';
import 'package:grpc/grpc.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String _baseUrl = "https://api.chucknorris.io/";
  GreeterClient client;

  ApiProvider() {
    final channel = ClientChannel(
      '95.116.93.83',
      port: 5001,
      options: ChannelOptions(
        credentials:
            ChannelCredentials.secure(onBadCertificate: (_, __) => true),
      ),
    );
    client = GreeterClient(channel);

    try {
      client.sayHello(HelloRequest()..name = 'test');
    } catch (e) {
      print('test');
      print(e);
    }
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
