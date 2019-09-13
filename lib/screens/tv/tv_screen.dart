import 'package:cinema_flt/bloc/tv_bloc.dart';
import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/models/tv/tv_result.dart';
import 'package:cinema_flt/repository/tv_repository.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_populer.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/tv_video.dart';

class TvScreen extends StatefulWidget {
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  TvBloc _tvBloc;

  @override
  void didChangeDependencies() {
    _tvBloc = Provider.of<TvBloc>(context, listen: false);
    _tvBloc.getTvContent();
    super.didChangeDependencies();
  }

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
    return StreamBuilder(
        stream: _tvBloc.onAir,
        builder: (context, AsyncSnapshot<TvResult> snapshot) {
          if (snapshot.data == null || snapshot.data.results.isEmpty) {
            return Container();
          } else {
            return ContainerCategory('On Air', TvVideo(snapshot.data.results));
          }
        });
  }

  Widget _tvPopuler() {
    return StreamBuilder(
        stream: _tvBloc.populerTv,
        builder: (context, AsyncSnapshot<TvResult> snapshot) {
          if (snapshot.data == null || snapshot.data.results.isEmpty) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ContainerCategory(
                  'Populer', TvPopuler(snapshot.data.results)),
            );
          }
        });
  }

  // Widget _tvLatest() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 15),
  //     child: ContainerCategory('Latest', TvPopuler()),
  //   );
  // }

  Widget _tvTopRate() {
    return StreamBuilder(
        stream: _tvBloc.topTv,
        builder: (context, AsyncSnapshot<TvResult> snapshot) {
          if (snapshot.data == null || snapshot.data.results.isEmpty) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: ContainerCategory(
                  'Top Rate', TvPopuler(snapshot.data.results)),
            );
          }
        });
  }
}
