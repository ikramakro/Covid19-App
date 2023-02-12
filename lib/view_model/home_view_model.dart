import 'package:api_boilerplate/data/response/api_response.dart';
import 'package:api_boilerplate/modal/post_model.dart';
import 'package:api_boilerplate/repository/home_repositry.dart';
import 'package:flutter/material.dart';

class HomeviewModel with ChangeNotifier {
  final myrepo = HomeRepositry();
  ApiResponse<PostModel> postlist = ApiResponse.loading();
  setPostList(ApiResponse<PostModel> response) {
    postlist = response;
    notifyListeners();
  }

  Future<void> fetchpost() async {
    setPostList(ApiResponse.loading());

    myrepo.fetchpostApi().then((value) {
      setPostList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setPostList(ApiResponse.error('====>>>>>${error.toString()}'));
    });
  }
}
