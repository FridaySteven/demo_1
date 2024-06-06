import 'package:demo_1/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => homeProvider.onPopScop(didPop),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Detail Page ${widget.id}'),
            automaticallyImplyLeading: false,
            leading: BackButton(
              onPressed: homeProvider.onBackPageView,
            ),
          ),
        ),
      );
    });
  }
}
