import 'package:cinema_flt/components/widgets/placeholder/tv_populer_item_placeholder.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_populer_item.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TvPopuler extends StatefulWidget {
  final List<TV>? movies;

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
          case DeviceScreenType.desktop:
            return buildBody(DEKSTOP, DeviceScreenType.desktop);
          default:
            final screenWidth = MediaQuery.of(context).size.width;
            return buildBody(screenWidth, DeviceScreenType.mobile);
        }
      },
    );
  }

  Widget buildBody(double screenWidth, DeviceScreenType device) {
    final heightCard = device == DeviceScreenType.mobile
        ? screenWidth / 2 + 8
        : screenWidth / 2 + 20;
    final imageWidth = (screenWidth / 2) / 1.83;
    final imageHeight = imageWidth + (imageWidth / 2.5);
    return SizedBox(
      width: double.infinity,
      height: heightCard,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => SizedBox(
            width: imageWidth,
            child: widget.movies == null
                ? TvPopulerItemPlaceholder(imageHeight)
                : TvPopulerItem(widget.movies![index], imageHeight))),
        separatorBuilder: (context, index) =>
            SizedBox(height: 15.0, width: 15.0),
        itemCount: widget.movies?.length ?? 0,
      ),
    );
  }
}
