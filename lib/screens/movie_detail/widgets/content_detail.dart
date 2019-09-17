import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/components/widgets/rating_result.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';

import 'cast_detail_item.dart';

class ContentDetail extends StatelessWidget {
  final List<String> _items = ['action', 'comedy', 'family'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(25),
        ),
      ),
      child: _contentBody(),
    );
  }

  Widget _contentBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _contentTitle(),
        _contentCast(),
      ],
    );
  }

  Widget _contentTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Alita: Battle Angle',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RatingResult(8.9, 12.0)
            ],
          ),
          SizedBox(height: 7),
          _genreMovies(),
          SizedBox(height: 10),
          _contentAbout(),
          SizedBox(height: 10),
          AppStyle.textTitleSection(
            'Overview',
            AppStyle.getColor(ThemeColor.blackText),
          ),
          SizedBox(height: 7),
          Text(
            "27 years after overcoming the malevolent supernatural entity Pennywise, the former members of the Losers' Club, who have grown up and moved away from Derry, are brought back together by a devastating phone call.",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentCast() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppStyle.textTitleSection(
            'Full Cast',
            AppStyle.getColor(ThemeColor.blackText),
          ),
        ),
        SizedBox(height: 10),
        CastDetailItem()
      ],
    );
  }

  Widget _genreMovies() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Tags(
        itemCount: _items.length, // required
        itemBuilder: (int index) {
          final item = _items[index];
          return ItemTags(
            key: Key(index.toString()),
            index: index, // required
            title: item,
            active: false,
            textStyle: TextStyle(fontSize: 12),
            elevation: 0,
            textColor: AppStyle.getColor(ThemeColor.primary),
            border: Border.all(
              color: AppStyle.getColor(ThemeColor.primary),
            ),
            pressEnabled: false,
            onLongPressed: null,
          );
        },
      ),
    );
  }

  Widget _contentAbout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _contentDescriptionAbout('Status', 'Released'),
              _contentDescriptionAbout('Runtime', '2h 50m'),
              _contentDescriptionAbout('Premiere', 'December 15, 1995'),
              _contentDescriptionAbout('Budget', '\$60,000,000,000'),
              _contentDescriptionAbout('Revenue', '\$187,234,355,000'),
            ],
          ),
          Container(
            width: 80,
            height: 125,
            child: ImageNetwork(
                'http://image.tmdb.org/t/p/w185//tZ55C7gPExwzvBLCsZMqFZMbB2I.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _contentDescriptionAbout(String title, String value) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppStyle.getColor(ThemeColor.blackText),
                  letterSpacing: 0.5),
              textAlign: TextAlign.start,
            ),
            Text(' : '),
            Text(
              value,
              style: TextStyle(
                  fontSize: 14,
                  color: AppStyle.getColor(ThemeColor.primary),
                  letterSpacing: 0.5),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
