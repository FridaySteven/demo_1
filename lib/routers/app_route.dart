import 'package:demo_1/providers/home/home_provider.dart';
import 'package:demo_1/routers/app_route_name.dart';
import 'package:demo_1/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> myRoute(
      BuildContext context) {
    return {
      AppRouteName.home: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => HomeProvider()),
            ],
            child: const HomeScreen(),
          ),
    };
  }
}
