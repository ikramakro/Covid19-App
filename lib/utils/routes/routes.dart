import 'package:api_boilerplate/utils/routes/routes_name.dart';
import 'package:api_boilerplate/view/country_list_screen.dart';
import 'package:api_boilerplate/view/home_screen.dart';
import 'package:api_boilerplate/view/login_screen.dart';
import 'package:api_boilerplate/view/onboarding_screen.dart';
import 'package:api_boilerplate/view/signup_screen.dart';
import 'package:api_boilerplate/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generatesRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.onbording:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingScreen());
      case RoutesName.countrylist:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CountryListScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No Routes Difined')),
          );
        });
    }
  }
}
