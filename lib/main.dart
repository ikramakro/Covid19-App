import 'package:api_boilerplate/utils/constant/color.dart';
import 'package:api_boilerplate/utils/routes/routes.dart';
import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/view_model/auth_view_model.dart';
import 'package:api_boilerplate/view_model/country_list_view_model.dart';
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
        ChangeNotifierProvider<CountryListViewModel>(
            create: (_) => CountryListViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19 Tracker',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor),
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generatesRoutes,
      ),
    );
  }
}
