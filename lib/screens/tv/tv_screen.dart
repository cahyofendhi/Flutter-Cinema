import 'package:cinema_flt/bloc/tv/tv_event.dart';
import 'package:cinema_flt/bloc/tv/tv_state.dart';
import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_populer.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../bloc/tv/tv_bloc.dart';
import 'widgets/tv_video.dart';

class TvScreen extends StatefulWidget {
  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  TvBloc? _tvBloc;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _tvBloc = TvBloc();
  }

  void _onRefresh() async {
    _tvBloc!.add(TvInitEvent());
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _tvBloc!..add(TvInitEvent()),
      child: Scaffold(
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
      ),
    );
  }

  AppBar _appBar() {
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
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) => previous.onAir != current.onAir,
      builder: (context, state) {
        return state.onAirStatus == FormzStatus.submissionInProgress
            ? ContainerCategory('On Air', TvVideo(null))
            : state.onAirStatus == FormzStatus.submissionSuccess
                ? ContainerCategory(
                    'On Air', TvVideo(state.onAir?.results ?? []))
                : Container();
      },
    );
  }

  Widget _tvPopuler() {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) => previous.popular != current.popular,
      builder: (context, state) {
        return state.popularStatus == FormzStatus.submissionInProgress
            ? Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ContainerCategory('Popular', TvPopuler(null)),
              )
            : state.popularStatus == FormzStatus.submissionSuccess
                ? Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ContainerCategory(
                        'Popular', TvPopuler(state.popular?.results ?? [])),
                  )
                : Container();
      },
    );
  }

  Widget _tvTopRate() {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) => previous.top != current.top,
      builder: (context, state) {
        return state.topStatus == FormzStatus.submissionInProgress
            ? Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ContainerCategory('Top Rate', TvPopuler(null)),
              )
            : state.topStatus == FormzStatus.submissionSuccess
                ? Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ContainerCategory(
                        'Top Rate', TvPopuler(state.top?.results ?? [])),
                  )
                : Container();
      },
    );
  }
}
