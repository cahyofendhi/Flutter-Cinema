import 'package:cinema_flt/screens/tv/widgets/tv_video_item.dart';
import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

class TvVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthCard = screenWidth / 3;
    final heightCard = widthCard / 2;
    final Size cardSize = Size(widthCard, heightCard);
    return SizedBox(
      width: double.infinity,
      height: heightCard,
      child: SnapList(
        padding: EdgeInsets.symmetric(horizontal: 25),
        sizeProvider: (index, data) => cardSize,
        separatorProvider: (index, data) => Size(15.0, 15.0),
        builder: (context, index, data) {
          return TvVideoItem(index);
        },
        count: 5,
      ),
    );
  }
}
