import 'package:cinema_flt/bloc/search/search_bloc.dart';
import 'package:cinema_flt/bloc/search/search_event.dart';
import 'package:cinema_flt/bloc/search/search_state.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MovieSearch extends StatefulWidget {
  static const routeName = '/search-page';

  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  static final defaultTitle = 'Movie Search';
  String querySearch = '';
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = Text(defaultTitle);

  SearchBloc? _movieSearchBloc;
  List<Movie> movies = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int totalPage = 0;
  int page = 1;

  onSubmitted(String value) {
    setState(() {
      querySearch = value;
      customIcon = const Icon(Icons.search);
      customSearchBar = Text(defaultTitle);
    });
    _movieSearchBloc!.add(SubmitSearchEvent(value));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: customSearchBar,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppStyle.getColor(ThemeColor.secondary),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
                customIcon = const Icon(Icons.cancel);
                customSearchBar = ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'search...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                    onSubmitted: onSubmitted,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                customIcon = const Icon(Icons.search);
                customSearchBar = Text(defaultTitle);
              }
            });
          },
          icon: customIcon,
        )
      ],
      centerTitle: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _movieSearchBloc = context.read<SearchBloc>()..add(SearchInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (ctx, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return Scaffold(
              backgroundColor: AppStyle.greyApp,
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  width: DEKSTOP,
                  child: buildBody(),
                ),
              ),
            );
          case DeviceScreenType.tablet:
            return Scaffold(
              backgroundColor: AppStyle.greyApp,
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  width: TABLET,
                  child: buildBody(),
                ),
              ),
            );
          default:
            return buildBody();
        }
      },
    );
  }

  Widget buildBody() {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.movieStatus == FormzStatus.submissionInProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state.movieStatus == FormzStatus.submissionSuccess) {
              MoviesResult data = state.movies!;
              totalPage = data.totalPages ?? 0;
              page = data.page ?? 0;
              final result = data.results;
              _refreshController.loadComplete();
              if (result.isNotEmpty) {
                if (page == 1) {
                  movies = result;
                } else {
                  movies.insertAll(movies.length, result);
                }
                return _contentList();
              } else {
                return _emptyView();
              }
            } else {
              return _initializeView();
            }
          },
        ));
  }

  Widget _contentList() {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget? body;
          if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          }
          return Container(
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: body),
            ),
          );
        },
      ),
      controller: _refreshController,
      onLoading: _onLoading,
      child: TrendingMovie(movies),
    );
  }

  void _onLoading() {
    _movieSearchBloc!.add(SubmitSearchEvent(querySearch));
  }

  Widget _emptyView() {
    return _blankPage(
        'assets/images/icon_not_found.png', 'No search results found');
  }

  Widget _initializeView() =>
      _blankPage('assets/images/icon_movie.png', 'Movie Search Page');

  Widget _blankPage(String icon, String name) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  icon,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: AppStyle.getColor(ThemeColor.blackText),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
