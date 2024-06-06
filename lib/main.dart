import 'package:demo_1/providers/share/theme_provider.dart';
import 'package:demo_1/main_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: const MainApp(),
    ),
  );
}
