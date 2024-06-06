import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageComponent extends StatelessWidget {
  const CachedNetworkImageComponent({
    super.key,
    required this.imgUrl,
    this.boxFit,
  });

  final String imgUrl;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: boxFit,
      placeholder: (context, url) => Shimmer.fromColors(
          period: const Duration(milliseconds: 850),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: Container(
            color: Colors.amber,
          )),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
