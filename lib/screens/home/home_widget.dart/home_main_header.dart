import 'package:demo_1/components/cached_network_image_component.dart';
import 'package:demo_1/components/theme_switch_component.dart';
import 'package:demo_1/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomeMainHeader extends StatelessWidget {
  const HomeMainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      return SliverAppBar(
        expandedHeight: 130,
        stretch: true,
        automaticallyImplyLeading: false,
        pinned: homeProvider.pinnedMainHeader,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          stretchModes: const [StretchMode.zoomBackground],
          background: Stack(
            fit: StackFit.expand,
            children: [
              const CachedNetworkImageComponent(
                imgUrl:
                    'https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExd2l1a3l3azdwMG9wNTNzMTF2M2g3aGoxNDd4OWdpYmdteDFrcGt1eiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgkwR8wkzvDh68M/giphy.gif',
                boxFit: BoxFit.cover,
              ),
              CustomPaint(
                size: Size(
                    MediaQuery.sizeOf(context).width,
                    ((MediaQuery.sizeOf(context).width * 2 / 3) *
                            0.5555555555555556)
                        .toDouble()),
                painter: RPSCustomPainter(context),
              ),
              Positioned(
                left: 10,
                top: 40 + homeProvider.bounceTopOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .1,
                      height: MediaQuery.sizeOf(context).width * .1,
                      child: const ClipOval(
                        child: CachedNetworkImageComponent(
                          imgUrl:
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Gap(10),
                    const Text(
                      'Hi Home!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 40 + homeProvider.bounceTopOut,
                child: const ThemeSwitchComponent(),
              ),
            ],
          ),
        ),
      );
    });
  }
}

/// Do this with: https://fluttershapemaker.com/#/
class RPSCustomPainter extends CustomPainter {
  RPSCustomPainter(this.context);
  BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = Theme.of(context).colorScheme.secondaryContainer
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path0 = Path();
    path0.moveTo(0, size.height * -0.0007667);
    path0.lineTo(size.width * 0.9997889, 0);
    path0.quadraticBezierTo(size.width * 0.9999472, size.height * 0.6258000,
        size.width, size.height * 0.8344000);
    path0.cubicTo(
        size.width * 0.7785444,
        size.height * 0.9084333,
        size.width * 0.7502167,
        size.height * 0.5794750,
        size.width * 0.6669556,
        size.height * 0.4945000);
    path0.cubicTo(
        size.width * 0.5004889,
        size.height * 0.3328667,
        size.width * 0.4173389,
        size.height * 0.6268750,
        size.width * 0.3341333,
        size.height * 0.6710000);
    path0.quadraticBezierTo(size.width * 0.1674556, size.height * 0.7601000, 0,
        size.height * 0.5000000);
    path0.lineTo(0, size.height * -0.0007667);
    path0.close();

    canvas.drawPath(path0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
