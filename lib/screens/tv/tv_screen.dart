import 'package:cinema_flt/bloc/tv_bloc.dart';
import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/models/tv/tv_result.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_populer.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/tv_video.dart';

class TvScreen extends StatefulWidget {
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  TvBloc _tvBloc;

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void didChangeDependencies() {
    _tvBloc = Provider.of<TvBloc>(context, listen: false);
    _tvBloc.getTvContent();
    super.didChangeDependencies();
  }

  void _onRefresh() async{
    await _tvBloc.getTvContent();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: _refreshController,
        header: WaterDropHeader(),
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _tvVideo(),
              _tvPopuler(),
              _tvTopRate(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(
        'TV Cinema',
        style: TextStyle(
          color: AppStyle.getColor(ThemeColor.blackText),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: AppStyle.getColor(ThemeColor.blackText),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _tvVideo() {
    return StreamBuilder(
        stream: _tvBloc.onAir,
        builder: (context, AsyncSnapshot<TvResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ContainerCategory('On Air', TvVideo(null));
          } else if (snapshot.data == null || snapshot.data.results.isEmpty) {
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ContainerCategory('Populer', TvPopuler(null)),
            );
          } else if (snapshot.data == null || snapshot.data.results.isEmpty) {
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
