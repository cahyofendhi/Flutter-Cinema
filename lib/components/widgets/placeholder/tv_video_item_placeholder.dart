import 'package:cinema_flt/components/widgets/shimmer_content.dart';
import 'package:flutter/material.dart';

class TvVideoItemPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerContent(
      Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
          ),
          Center(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
