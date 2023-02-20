import 'package:api_boilerplate/data/network/base_api_services.dart';
import 'package:api_boilerplate/data/network/network_api_services.dart';
import 'package:api_boilerplate/res/app_url.dart';

class CountryListRepositry {
  BaseApiServices apiServices = NetworkApiServices();
  Future<List<dynamic>> getcountrylist() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppEndpoints.country);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
