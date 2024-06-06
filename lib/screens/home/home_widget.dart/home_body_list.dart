import 'package:demo_1/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeBodyList extends StatefulWidget {
  const HomeBodyList({
    super.key,
  });

  @override
  State<HomeBodyList> createState() => _HomeBodyListState();
}

class _HomeBodyListState extends State<HomeBodyList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return SliverToBoxAdapter(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 100,
          itemBuilder: (context, index) {
            return AnimatedPadding(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(top: homeProvider.bounceTopOut),
              child: GestureDetector(
                onTap: () => homeProvider.onOpenDetails(index),
                child: Card(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card.filled(
                          child: Icon(
                            Icons.abc,
                            size: MediaQuery.sizeOf(context).width * 0.5,
                          ),
                        ),
                        const Gap(10),
                        Text('Detail $index'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
