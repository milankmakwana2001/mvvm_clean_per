import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:mvvm_clean_per/data/api_services/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiServices {
  final http.Client client;
  NetworkApiService({required this.client});
  @override
  Future<dynamic> callGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await client.get(Uri.parse(url));
      responseJson = await returnResponse(response);
      return responseJson;
    } on SocketException {
      throw Exception(
          'No internet from NetworkApiService in callGetApiResponse');
    } catch (e) {
      throw Exception(
          '${e.toString()} from NetworkApiService in callGetApiResponse');
    }
  }

  @override
  Future<dynamic> callPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data,);
      responseJson = await returnResponse(response);
      log('${responseJson}');
      return responseJson;
    } on SocketException {
      throw Exception(
          'No internet from NetworkApiService in callPostApiResponse');
    } catch (e) {
      throw Exception(
          '${e.toString()} from NetworkApiService in callPostApiResponse');
    }
  }

  returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic returnResponse = await json.decode(response.body);
        return returnResponse;
      case 201:
        dynamic returnResponse = await json.decode(response.body);
        return returnResponse;

      default:
        return Exception('returnResponse from NetworkApiService');
    }
  }
}
