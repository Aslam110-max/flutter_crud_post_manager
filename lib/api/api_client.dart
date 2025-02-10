import 'dart:convert';
import 'package:flutter_crud_post_manager/common/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxService {
  final String appBaseUrl;
  static const String noInternetMessage = 'Connection to API server failed';
  final int timeoutInSeconds = 40;
  String? token;
  final Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ApiClient({required this.appBaseUrl});

  Future<Response> getData(String uri) async {
    try {
      http.Response response = await http
          .get(Uri.parse(appBaseUrl + uri), headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response);
    } catch (_) {
      showCustomSnackBar(noInternetMessage);
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body
     ) async {
    try {
      http.Response response = await http
          .post(Uri.parse(appBaseUrl + uri),
              body: jsonEncode(body), headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response);
    } catch (_) {
      showCustomSnackBar(noInternetMessage);
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body,
      ) async {
    try {
      http.Response response = await http
          .put(Uri.parse(appBaseUrl + uri),
              body: jsonEncode(body), headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response);
    } catch (_) {
      showCustomSnackBar(noInternetMessage);
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri,
   ) async {
    try {
      http.Response response = await http
          .delete(Uri.parse(appBaseUrl + uri), headers: _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response);
    } catch (_) {
      showCustomSnackBar(noInternetMessage);
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {
      body = response.body;
    }
    return Response(
      body: body,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
  }
}
