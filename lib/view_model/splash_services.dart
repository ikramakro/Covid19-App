import 'package:api_boilerplate/modal/user_model.dart';
import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<UserModel> getuser() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) {
    getuser().then((value) {
      if (kDebugMode) {}
      if (value.token.toString() == 'null' || value.token.toString() == '') {
        Navigator.pushNamed(context, RoutesName.onbording);
      } else {
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
