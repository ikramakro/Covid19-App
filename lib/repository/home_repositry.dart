import 'package:api_boilerplate/data/network/base_api_services.dart';
import 'package:api_boilerplate/data/network/network_api_services.dart';
import 'package:api_boilerplate/modal/post_model.dart';
import 'package:api_boilerplate/res/app_url.dart';

class HomeRepositry {
  BaseApiServices apiServices = NetworkApiServices();
  Future<AllCasesModel> fetchgetApi() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppEndpoints.worldstate);
      return response = AllCasesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
