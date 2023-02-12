import 'dart:convert';
import 'dart:io';

import 'package:api_boilerplate/data/app_exception.dart';
import 'package:api_boilerplate/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(
    String url,
  ) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('no internet connection');
    }
    return responsejson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responsejson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('no internet connection');
    }
    return responsejson;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responsejson = jsonDecode(response.body);
      return responsejson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw BadRequestException(response.body.toString());
    default:
      throw FetchDataException(
          'error occured while communction with server ${response.statusCode.toString()}');
  }
}
