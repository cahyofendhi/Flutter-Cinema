import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class TvPopulerItemPlaceholder extends StatelessWidget {
  final imageHeight;

  TvPopulerItemPlaceholder(this.imageHeight);

  @override
  Widget build(BuildContext context) {
    return ShimmerContent(
      Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: imageHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black),
            width: 100,
            height: 10,
          )
        ],
      ),
    );
  }
}
