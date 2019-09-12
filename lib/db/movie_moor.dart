import 'dart:convert';

import 'package:cinema_flt/models/movie/movie.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'movie_db.dart';

part 'movie_moor.g.dart';

@UseDao(tables: [Movies])
class MovieMoor extends DatabaseAccessor<MovieDb> with _$MovieMoorMixin {
  MovieMoor(MovieDb db) : super(db);

  Future insertOrReplaceMovie(MoviesCompanion data) =>
      into(movies).insert(data, orReplace: true);

  Future<List<MovieEntry>> getMovieList(
      {bool isPopuler = false,
      bool isUpcoming = false,
      bool isToprate = false}) {
    // return (select(users)..where((user) => user.id.equals(id))).getSingle();
    // return (select(movies)
    //       ..where((mo) {
    //         return mo.upcoming.equals(true);
    //       },))
    //     .get();

    // return ((select(movies).get()));
    return (select(movies)
          ..where(
            (t) {
              if (isPopuler) {
                print("getPopuler");
                return t.popular.equals(isPopuler);
              } else if (isUpcoming) {
                print("getUpcoming");
                return t.upcoming.equals(isUpcoming);
              } else {
                print("getTopRate");
                return t.topRate.equals(isToprate);
              }
            },
          ))
        .get();
  }

  Future<void> insertMovie(
      {List<Movie> datas,
      bool isPopuler = false,
      bool isUpcoming = false,
      bool isTopRate = false}) async {
    await datas.forEach((dt) {
      MoviesCompanion companion = MoviesCompanion(
          video: Value(dt.video),
          posterPath: Value(dt.posterPath),
          idMovie: Value(dt.id),
          voteCount: Value(dt.voteCount),
          popularity: Value(dt.popularity),
          adult: Value(dt.adult),
          backdropPath: Value(dt.backdropPath),
          originalLanguage: Value(dt.originalLanguage),
          originalTitle: Value(dt.originalTitle),
          title: Value(dt.title),
          voteAverage: Value(dt.voteAverage),
          genreIds: Value(dt.genreIds.toString()),
          overview: Value(dt.overview),
          releaseDate: Value(dt.releaseDate),
          upcoming: Value(true),
          popular: Value(true),
          topRate: Value(true));
      insertOrReplaceMovie(companion).then((s) {
        print('Save success : $s');
      }).catchError((err) {
        print('Error Save : ${err.toString()}');
      });
    });
  }
}
