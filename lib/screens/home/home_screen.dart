import 'package:cinema_flt/components/widgets/title_category.dart';
import 'package:cinema_flt/screens/home/widgets/populer_movie_slider.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/screens/home/widgets/upcoming_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headerView(),
            _populerMovie(),
            _upcomingMovie(),
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

  Widget _populerMovie() {
    return _containerCategory('Upcoming Movie', UpcomingMovieSlider());
  }

  Widget _upcomingMovie() {
    return _containerCategory('Populer Movie', PopulerMovieSlider());
  }

  Widget _trendingMovie() {
    return _containerCategory('Trending Movie', TrendingMovie());
  }

  Widget _containerCategory(String title, Widget content) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TitleCategory(
                title,
                AppStyle.getColor(ThemeColor.blackText),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          content,
        ],
      ),
    );
  }

}
