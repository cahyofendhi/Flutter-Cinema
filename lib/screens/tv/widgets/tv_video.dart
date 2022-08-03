import 'package:cinema_flt/components/widgets/placeholder/tv_video_item_placeholder.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_video_item.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TvVideo extends StatelessWidget {
  final List<TV>? movies;

  TvVideo(this.movies);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (cxt, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.tablet:
            return buildBody(TABLET);
          case DeviceScreenType.desktop:
            return buildBody(DEKSTOP);
          default:
            final screenWidth = MediaQuery.of(context).size.width;
            return buildBody(screenWidth);
        }
      },
    );
  }

  Widget buildBody(double screenWidth) {
    final widthCard = screenWidth / 3;
    final heightCard = widthCard / 2;
    return SizedBox(
      width: double.infinity,
      height: heightCard,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => SizedBox(
            width: widthCard,
            child: movies == null
                ? TvVideoItemPlaceholder()
                : TvVideoItem(movies![index]))),
        separatorBuilder: (context, index) =>
            SizedBox(height: 15.0, width: 15.0),
        itemCount: movies?.length ?? 0,
      ),
    );
  }
}
