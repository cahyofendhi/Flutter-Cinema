import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContent extends StatelessWidget {
  Widget widget;

  ShimmerContent(this.widget);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: widget,
    );
  }
}
