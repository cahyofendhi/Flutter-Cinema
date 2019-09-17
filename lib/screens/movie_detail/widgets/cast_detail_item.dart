import 'package:flutter/material.dart';

class CastDetailItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final leftMargin = index == 0 ? 15.0 : 5.0;
          return Container(
            width: 100,
            child: Padding(
              padding: EdgeInsets.only(
                  left: leftMargin, bottom: 5, right: 5, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: FadeInImage.assetNetwork(
                      image:
                          'http://image.tmdb.org/t/p/w185//yOwYh9R4LFulxWb1GdwO7Z1mjLe.jpg',
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
                      'Steven Arnold Efendhi',
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
        },
        itemCount: 10,
      ),
    );
  }
}
