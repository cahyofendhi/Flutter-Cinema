import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    Key? key,
    required this.leftMargin,
    required this.item,
  }) : super(key: key);

  final double leftMargin;
  final Cast item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Padding(
        padding: EdgeInsets.only(left: leftMargin, bottom: 5, right: 5, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FadeInImage.assetNetwork(
                image: getTheMovieImage(item.profilePath ?? ''),
                placeholder: 'assets/images/placeholder.jpg',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(
                item.name ?? '',
                style: TextStyle(fontSize: 10.0),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
