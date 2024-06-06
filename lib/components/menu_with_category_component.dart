import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuWithCategoryComponent extends StatefulWidget {
  const MenuWithCategoryComponent({super.key});

  @override
  State<MenuWithCategoryComponent> createState() => _MenuWithCategoryComponentState();
}

class _MenuWithCategoryComponentState extends State<MenuWithCategoryComponent> {
 final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final ItemScrollController itemScrollControllerM = ItemScrollController();
  final ItemPositionsListener itemPositionsListenerM =
      ItemPositionsListener.create();

  final int mainCountLength = 31;
  int currentMainIndex = 0;
  int previousMainIndex = 0;
  List<int> sideVisibleList = [];
  bool isRunningSide = false;
  bool isRunningMain = false;
  final scrollDuration = const Duration(milliseconds: 400);
  final scrollAlignment = .01;

  @override
  void initState() {
    super.initState();

    itemPositionsListenerM.itemPositions.addListener(_mainListListener);
  }

  void _mainListListener() async {
    if (!isRunningSide && !isRunningMain) {
      currentMainIndex = itemPositionsListenerM.itemPositions.value.last.index;

      if (currentMainIndex != previousMainIndex) {
        previousMainIndex = currentMainIndex;

        isRunningMain = true;
        setState(() {});

        await _helpScrollSideList();

        isRunningMain = false;
        setState(() {});
      }
    }
  }

  Future<void> _helpScrollSideList({int? idx}) async {
    final scrollIndex = idx ?? currentMainIndex;
    bool firstWhileLastExis = false;

    resetSideVisibleList();
    if (sideVisibleList.contains(mainCountLength - 1)) {
      final topLast = sideVisibleList.first;
      firstWhileLastExis = scrollIndex < topLast;
    }
    final notFirstLast = (!sideVisibleList.contains(mainCountLength - 1) &&
        !sideVisibleList.contains(0));
    final overFirstWhileNotLast =
        scrollIndex > 0 && !sideVisibleList.contains(mainCountLength - 1);

    if (firstWhileLastExis || notFirstLast || overFirstWhileNotLast) {
      await itemScrollController.scrollTo(
        alignment: scrollIndex >= 1 ? 0 : scrollAlignment,
        index: scrollIndex,
        duration: scrollDuration,
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _helpScrollMainList(int index) async {
    await itemScrollControllerM.scrollTo(
      index: index,
      duration: scrollDuration,
      curve: Curves.easeOut,
    );
  }

  void resetSideVisibleList() {
    sideVisibleList = itemPositionsListener.itemPositions.value
        .where((element) =>
            element.itemLeadingEdge >= 0 && element.itemTrailingEdge <= 1)
        .map((e) => e.index)
        .toList();
  }

  void _onSideListTap(int index) async {
    if (isRunningSide || isRunningMain) return;

    isRunningSide = true;
    setState(() {});

    if (index != previousMainIndex) {
      previousMainIndex = currentMainIndex;

      _helpScrollSideList(idx: index);
      await _helpScrollMainList(index);
    }

    currentMainIndex = index;
    isRunningSide = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('home'),
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _sideMenu(),
            _mainMenu(),
          ],
        ),
      ),
    );
  }

  Flexible _mainMenu() {
    return Flexible(
      flex: 4,
      child: ScrollablePositionedList.builder(
        physics: const ClampingScrollPhysics(),
        itemScrollController: itemScrollControllerM,
        itemPositionsListener: itemPositionsListenerM,
        padding: const EdgeInsets.only(left: 10),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title $index',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 20,
                    height: 20,
                    color: Colors.amber,
                    child: Text(
                      'data $index',
                    ),
                  );
                },
              )
            ],
          );
        },
        itemCount: mainCountLength,
      ),
    );
  }

  Flexible _sideMenu() {
    return Flexible(
      flex: 1,
      child: ScrollablePositionedList.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onSideListTap(index),
            child: Container(
              width: 20,
              height: 100,
              color:
                  currentMainIndex == index ? Colors.redAccent : Colors.green,
              child: Text(
                'data $index',
              ),
            ),
          );
        },
        itemCount: mainCountLength,
      ),
    );
  }
}
