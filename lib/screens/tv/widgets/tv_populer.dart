import 'package:cinema_flt/components/widgets/placeholder/tv_populer_item_placeholder.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_populer_item.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:snaplist/snaplist.dart';

class TvPopuler extends StatefulWidget {
  final List<TV> movies;

  TvPopuler(this.movies);

  @override
  _TvPopulerState createState() => _TvPopulerState();
}

class _TvPopulerState extends State<TvPopuler> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (cxt, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.tablet:
            return buildBody(TABLET, DeviceScreenType.tablet);
            break;
          case DeviceScreenType.desktop:
            return buildBody(DEKSTOP, DeviceScreenType.desktop);
            break;
          default:
            final screenWidth = MediaQuery.of(context).size.width;
            return buildBody(screenWidth, DeviceScreenType.mobile);
        }
      },
    );
  }

  Widget buildBody(double screenWidth, DeviceScreenType device) {
    final heightCard = device == DeviceScreenType.mobile ? screenWidth / 2 : screenWidth / 2 + 20;
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
          return widget.movies == null
              ? TvPopulerItemPlaceholder(imageHeight)
              : TvPopulerItem(widget.movies[index], imageHeight);
        },
        count: widget.movies == null ? 5 : widget.movies.length,
      ),
    );
  }
}
