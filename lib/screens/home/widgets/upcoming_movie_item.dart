import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UpcomingMovieItem extends StatelessWidget {
  final index;

  UpcomingMovieItem(this.index);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: screenWidth / 3,
            height: screenWidth / 2.7,
            decoration: BoxDecoration(
              color: Colors.amber,
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
              child: Image.asset(
                index % 2 == 0
                    ? 'assets/images/sample_7.jpeg'
                    : 'assets/images/sample_4.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppStyle.textTitleBoldItem(
            'Avanged End Game',
            AppStyle.getColor(ThemeColor.blackText),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RatingBar(
              initialRating: 3,
              textDirection: TextDirection.ltr,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: null,
            ),
          ),
          AppStyle.textSubtitle(
            'Adventure, Action',
            AppStyle.getColor(ThemeColor.greyTextDesc),
          ),
          SizedBox(
            height: 3,
          ),
          AppStyle.textSubtitle(
            '2h 3min',
            AppStyle.getColor(ThemeColor.greyTextDesc),
          ),
        ],
      ),
    );
  }
}
