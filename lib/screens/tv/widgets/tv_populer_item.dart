import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';

class TvPopulerItem extends StatelessWidget {

  final TvMovie movie;
  final imageHeight;

  TvPopulerItem(this.movie, this.imageHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: Offset(1.09, 5.0),
                  blurRadius: 4.0),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: ImageNetwork(getImageTheMovie(movie.posterPath)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AppStyle.textTitleBoldItem(
          movie.originalName,
          AppStyle.getColor(ThemeColor.blackText),
        )
      ],
    );
  }
}
