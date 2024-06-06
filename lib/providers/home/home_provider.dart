import 'package:demo_1/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier {
  late ScrollController homeScrollCtr;
  late PageController homePageViewCtr;

  final List<Widget> homePageViewList = [];

  bool pinnedMainHeader = true;
  double bounceTopOut = .0;

  void onInit() {
    homeScrollCtr = ScrollController();
    homePageViewCtr = PageController();

    homeScrollCtr.addListener(_mainListiner);
  }

  void onDispose() {
    homePageViewList.clear();
    homeScrollCtr.removeListener(_mainListiner);
    homeScrollCtr.dispose();
  }

  void _mainListiner() {
    final pixels = homeScrollCtr.position.pixels;
    if (pixels < homeScrollCtr.position.minScrollExtent) {
      final roundedPixels = pixels * -1;
      if (roundedPixels >= 0 && roundedPixels < 40) {
        bounceTopOut = roundedPixels;
        notifyListeners();
      }
    } else {
      if (bounceTopOut != 0) {
        bounceTopOut = 0;
        notifyListeners();
      }
    }

    final currentNotPositionMoreThan90 = !(pixels > 60);
    if (pinnedMainHeader != currentNotPositionMoreThan90) {
      pinnedMainHeader = currentNotPositionMoreThan90;
      notifyListeners();
    }
  }

  //#region Page view controller
  bool isUserPop = false;
  int previousPageViewIdx = 0;
  int currentPageViewIdx = 0;

  void onPageViewChange(int index) {
    if (previousPageViewIdx != currentPageViewIdx) {
      previousPageViewIdx = currentPageViewIdx;
    }

    currentPageViewIdx = index;

    if (!isUserPop && currentPageViewIdx < previousPageViewIdx) {
      onBackPageView();
    }
  }

  void onPopScop(bool didPop) {
    onBackPageView();
  }

  void onBackPageView() async {
    isUserPop = true;
    notifyListeners();

    await homePageViewCtr.animateToPage(
      homePageViewList.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );

    homePageViewList.removeLast();
    isUserPop = false;
    notifyListeners();
  }

  void onOpenDetails(int index) {
    homePageViewList.add(
      DetailScreen(id: index),
    );
    notifyListeners();

    homePageViewCtr.animateToPage(
      homePageViewList.length,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  //#endregion Page view controller
}
