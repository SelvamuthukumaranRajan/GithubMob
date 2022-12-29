import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

enum Method { get, post, put, delete }

class BaseApiProvider extends GetConnect {
  String baseurl = "https://api.github.com/";

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 20);
    addRequestModifier();
    httpClient.addResponseModifier(
      (request, response) => interceptor(
        httpClient,
        request,
        response,
      ),
    );
  }

  void addRequestModifier() {
    httpClient.addRequestModifier<dynamic>((request) {
      //TODO: Add your authorized key(Access Token from Github) to increase your Github API hit limit
      // String token = 'Your_Access_Token';
      String token = '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';
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }

  FutureOr interceptor(
    GetHttpClient httpClient,
    Request request,
    Response response,
  ) {
    Get.printInfo(
        info: 'Request: ${request.url}, Status Code: ${response.statusCode}\n'
        //     'Data: ${response.bodyString?.toString() ?? ''}',
        );
    return response;
  }

  Future<Response> apiRequest(
      String urlStr, Method method, dynamic parameters) async {
    Response? response;
    // var connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   AppHelper.singleton.showNetworkErrorScreen();
    // }

    switch (method) {
      case Method.get:
        response = await get('$baseurl$urlStr');
        break;
      case Method.post:
        response = await post('$baseurl$urlStr', parameters);
        break;
      case Method.put:
        response = await put('$baseurl$urlStr', parameters);
        break;
      case Method.delete:
        response = await delete('$baseurl$urlStr');
        break;
    }

    if (response.statusCode != 200) {
      apiRequest(urlStr, method, parameters);
    }
    return response;
  }
}
