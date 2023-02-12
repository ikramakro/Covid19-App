import 'package:api_boilerplate/utils/routes/routes.dart';
import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/view_model/auth_view_model.dart';
import 'package:api_boilerplate/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generatesRoutes,
      ),
    );
  }
}
