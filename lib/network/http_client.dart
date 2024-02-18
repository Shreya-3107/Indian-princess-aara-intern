import 'dart:convert';

// import 'package:http/http.dart';
import 'package:dio/dio.dart';

class HttpClientAPI {
  // static Client client = Client();
  static String baseUrl = "http://localhost:3000";
  var dio = Dio();

  Future<Response> get(
      {required String endpoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    String url = '$baseUrl/$endpoint';
    print("url: $url");
    if (body != null) {
      print("body:$body");
      var response = await dio.get(url,
          options: Options(headers: addAuthenticationHeaders(headers ?? {})));


      return response;
    }
    var response = await dio.get(url,
        options: Options(headers: addAuthenticationHeaders(headers ?? {})));
    return response;

  }

  Future<Response> post(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) async {
    return await dio.post('$baseUrl/$endpoint',
        data: json.encode(body),
        options: Options(headers: addAuthenticationHeaders(headers ?? {})));
  }

  Future<Response> put(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) async {
    return await dio.put('$baseUrl/$endpoint',
        data: json.encode(body),
        options: Options(headers: addAuthenticationHeaders(headers ?? {})));
  }

  Future<Response> delete(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) async {
    return await dio.delete('$baseUrl/$endpoint',
        data: json.encode(body),
        options: Options(headers: addAuthenticationHeaders(headers ?? {})));
  }

  Map<String, dynamic> addAuthenticationHeaders(Map<String, dynamic> headers) {
    Map<String, dynamic> newHeaders = {};
    //String token = tokenController.text.toString();
    newHeaders.addAll(headers);
    newHeaders["Content-Type"] = "application/json";
    newHeaders["Access-Control-Allow-Origin"] = "*";
    newHeaders["Access-Control-Allow-Origin"] = "*";
    newHeaders["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS";
    newHeaders["Access-Control-Allow-Credentials"] = true;
   // newHeaders["Authorization"] = token;
    newHeaders["Access-Control-Allow-Headers"] =
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token";
    return newHeaders;
  }
}
