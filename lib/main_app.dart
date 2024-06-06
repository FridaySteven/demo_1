import 'package:demo_1/providers/share/theme_provider.dart';
import 'package:demo_1/routers/app_route.dart';
import 'package:demo_1/routers/app_route_name.dart';
import 'package:demo_1/utils/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      initialRoute: AppRouteName.home,
      routes: AppRouter.myRoute(context),
    );
  }
}
