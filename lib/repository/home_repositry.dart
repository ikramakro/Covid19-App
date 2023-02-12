import 'package:api_boilerplate/data/network/base_api_services.dart';
import 'package:api_boilerplate/data/network/network_api_services.dart';
import 'package:api_boilerplate/modal/post_model.dart';
import 'package:api_boilerplate/res/app_url.dart';

class HomeRepositry {
  BaseApiServices apiServices = NetworkApiServices();
  Future<PostModel> fetchpostApi() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(AppEndpoints.post);
      return response = PostModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
