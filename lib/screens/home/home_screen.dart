import 'package:demo_1/providers/home/home_provider.dart';
import 'package:demo_1/screens/home/home_widget.dart/home_widget_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<HomeProvider>(context).onInit();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();

    Provider.of<HomeProvider>(context).onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, homeProvider, _) {
        return PageView(
          controller: homeProvider.homePageViewCtr,
          onPageChanged: (idx) => homeProvider.onPageViewChange(idx),
          children: [
            CustomScrollView(
              controller: homeProvider.homeScrollCtr,
              physics: const BouncingScrollPhysics(),
              slivers: const [
                HomeMainHeader(),
                HomeSubHeader(),
                HomeBodyList(),
              ],
            ),
            ...homeProvider.homePageViewList,
          ],
        );
      }),
    );
  }
}
