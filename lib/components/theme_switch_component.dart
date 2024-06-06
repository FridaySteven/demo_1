import 'package:demo_1/providers/share/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitchComponent extends StatelessWidget {
  const ThemeSwitchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, _) {
      return Switch(
        value: provider.isSwitched,
        onChanged: (value) => provider.onChangeTheme(value),
      );
    });
  }
}
