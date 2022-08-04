import 'package:cinema_flt/components/widgets/placeholder/cast_item_placeholder.dart';
import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/screens/movie_detail/widgets/cast_item.dart';
import 'package:flutter/material.dart';

class CastDetailItem extends StatelessWidget {
  final MediaCredit? media;

  CastDetailItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final leftMargin = index == 0 ? 15.0 : 5.0;
          if (media != null) {
            Cast item = media!.cast![index];
            return CastItem(leftMargin: leftMargin, item: item);
          } else {
            return CastItemPlaceholder(leftMargin: leftMargin);
          }
        },
        itemCount: media == null ? 5 : media!.cast?.length,
      ),
    );
  }
}
