import 'package:cinema_flt/screens/tv/widgets/tv_populer_item.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

class TvPopuler extends StatefulWidget {

  @override
  _TvPopulerState createState() => _TvPopulerState();
}

class _TvPopulerState extends State<TvPopuler> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final heightCard = screenWidth / 2;
    final imageWidth = (screenWidth / 2) / 1.83;
    final imageHeight = imageWidth + (imageWidth / 2.5);
    final Size cardSize = Size(imageWidth, heightCard);
    return SizedBox(
      width: double.infinity,
      height: heightCard,
      child: SnapList(
        padding: EdgeInsets.symmetric(horizontal: 20),
        sizeProvider: (index, data) => cardSize,
        separatorProvider: (index, data) => Size(15.0, 15.0),
        builder: (context, index, data) {
          return TvPopulerItem(index, imageHeight);
        },
        count: 5,
      ),
    );
  }
}
