import 'package:dio/dio.dart';

class MyDio {
  static const String baseUrl = 'https://api.musixmatch.com/ws/1.1';

  // parameters and other stuff can be passed in BaseOptions()
  static BaseOptions options = BaseOptions(
    baseUrl: baseUrl,

    // not protecting the api key as of now
    // as it may need for others to test the code
    queryParameters: {'apikey': '191132592251448c11489af3ed8c5924'},
  );

  static Future<Dio> provideDio() async {
    final Dio dio = Dio(options);
    return dio;
  }
}
