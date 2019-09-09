import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_populer.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

import 'widgets/tv_video.dart';

class TvScreen extends StatefulWidget {
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _tvVideo(),
            _tvPopuler(),
            _tvLatest(),
            _tvTopRate(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        'TV Cinema',
        style: TextStyle(
          color: AppStyle.getColor(ThemeColor.blackText),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            print('search');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppStyle.getColor(ThemeColor.blackText),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tvVideo() {
    return ContainerCategory('Video', TvVideo());
  }

  Widget _tvPopuler() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ContainerCategory('Populer', TvPopuler()),
    );
  }

  Widget _tvLatest() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ContainerCategory('Latest', TvPopuler()),
    );
  }

  Widget _tvTopRate() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: ContainerCategory('Top Rate', TvPopuler()),
    );
  }
}
