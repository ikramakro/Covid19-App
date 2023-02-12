import 'package:api_boilerplate/modal/user_model.dart';
import 'package:api_boilerplate/repository/auth_repositry.dart';
import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/utils/utils.dart';
import 'package:api_boilerplate/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final myrepo = AuthRepositry();

  Future<void> loginapi(dynamic data, BuildContext context) async {
    myrepo.loginapi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
      final user = Provider.of<UserViewModel>(context, listen: false);

      user.saveUser(UserModel(token: value['token'].toString()));

      Utils.flushBar(context, 'user login');
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      Utils.flushBar(context, error.toString());
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    myrepo.signupapi(data).then((value) {
      Utils.flushBar(context, 'Sign in');
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      Utils.flushBar(context, error.toString());
    });
  }
}
