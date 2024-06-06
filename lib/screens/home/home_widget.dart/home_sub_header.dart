import 'package:flutter/material.dart';

class HomeSubHeader extends StatelessWidget {
  const HomeSubHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: _SliverHeader());
  }
}

const _maxHeaderExtent = 80.0;

class _SliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    /// > 0.0: on top
    final percent = shrinkOffset / _maxHeaderExtent;

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            color: Theme.of(context).colorScheme.tertiaryContainer,
            height: _maxHeaderExtent,
            padding: EdgeInsets.only(
                top: percent > 0 ? (percent * 20) : 10, left: 10, right: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchOutCurve: Curves.easeOut,
              child: percent > 0
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      width: double.maxFinite,
                      child: TextField(
                        textAlign: TextAlign.justify,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 13,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    )
                  : const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Something to say...',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text('More text to descript here ...'),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _maxHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
