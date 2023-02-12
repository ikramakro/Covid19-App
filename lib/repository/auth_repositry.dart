import 'package:api_boilerplate/data/network/base_api_services.dart';
import 'package:api_boilerplate/data/network/network_api_services.dart';
import 'package:api_boilerplate/res/app_url.dart';

class AuthRepositry {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginapi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppEndpoints.login, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupapi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppEndpoints.signup, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
