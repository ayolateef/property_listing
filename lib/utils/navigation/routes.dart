import 'package:flutter/material.dart';
import 'package:flutterflow_test/features/root/root.dart';
import '../../features/root/route/route.dart';
import '../../features/root/sign_in.dart';
import '../../features/root/widget/first_page.dart';
import '../../features/root/widget/rent_tab.dart';
import '../../features/root/widget/splash_screen.dart';

// ignore: prefer_function_declarations_over_variables
var routes = (RouteSettings settings) {
  switch (settings.name) {
    case RootRoutes.initial:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: const RouteSettings(name: RootRoutes.initial));

    case RootRoutes.firstPage:
      return MaterialPageRoute(
        builder: (context) => const FirstPage(),
      );

    case RootRoutes.root:
      return MaterialPageRoute(
        builder: (context) => const PropertyPage(),
      );
    case RootRoutes.signIn:
      return MaterialPageRoute(
        builder: (context) => SignInPage(),
      );

    case RootRoutes.rentPage:
      return MaterialPageRoute(
        builder: (context) => RentPage(),
      );
  }
  return null;
};
