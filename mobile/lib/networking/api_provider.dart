import 'package:grpc/grpc.dart';

class ApiProvider {
  ClientChannel _channel;

  ClientChannel get channel => _channel;
  static final ApiProvider _instance = new ApiProvider._internal();

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal() {
    _channel = ClientChannel(
      'wirvsvirus.ddns.net',
      port: 5001,
      options: ChannelOptions(
        credentials: ChannelCredentials.secure(
          onBadCertificate: (_, __) => true,
        ),
      ),
    );
  }

//  void matchStatusCodeToError(int statusCode) {
//    switch (statusCode) {
//      case
//    }
//  }
}
