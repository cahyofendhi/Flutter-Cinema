import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/screens/home/widgets/upcoming_movie_slider.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

import 'widgets/populer_movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    MovieRepository().getUpcomingMovie(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headerView(),
            _upcomingMovie(),
            _populerMovie(),
            _trendingMovie(),
          ],
        ),
      ),
    );
  }

  Widget _headerView() {
    return Container(
      //! header content
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      height: 150,
      child: _formSearch(),
    );
  }

  Widget _formSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: InkWell(
        onTap: () {
          print("click search");
        },
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppStyle.getColor(ThemeColor.greyYoung),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(
              width: 1,
              color: AppStyle.getColor(ThemeColor.grey),
            ),
          ),
          child: Row(
            //! SEARCH
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                //! parent search view
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Search your movie',
                    style: TextStyle(
                        color: AppStyle.getColor(ThemeColor.greyText)),
                  ),
                ),
              ),
              SizedBox(width: 10), //! space
              SizedBox(
                //! icon search
                width: 50,
                height: 50,
                child: Icon(
                  Icons.search,
                  color: AppStyle.getColor(ThemeColor.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _upcomingMovie() {
    return ContainerCategory('Upcoming Movie', UpcomingMovieSlider());
  }

  Widget _populerMovie() {
    return ContainerCategory('Populer Movie', PopulerMovieSlider());
  }

  Widget _trendingMovie() {
    return ContainerCategory('Trending Movie', TrendingMovie());
  }

}
