import 'dart:convert';

import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'movie_db.dart';

part 'movie_moor.g.dart';

@UseDao(tables: [Movies, Tv])
class MovieMoor extends DatabaseAccessor<MovieDb> with _$MovieMoorMixin {
  MovieMoor(MovieDb db) : super(db);

  Future insertOrReplaceMovie(List<MoviesCompanion> data) =>
      into(movies).insertAll(data);

  Future insertSingleMovie(MoviesCompanion data) =>
      into(movies).insert(data, orReplace: true);

  Future insertTvMovie(TvCompanion data) =>
      into(tv).insert(data, orReplace: true);

  Future<List<TvEntry>> getMovieTvList(
      {bool isOnAir = false, bool isPopuler = false, bool isTop = false}) {
    return (select(tv)
          ..where((t) => t.popular.equals(isPopuler))
          ..where((t) => t.topRate.equals(isTop))
          ..where((t) => t.onAir.equals(isOnAir)))
        .get();
  }

  Future<List<MovieEntry>> getMovieList(
      {bool isUpcoming = false,
      bool isPopuler = false,
      bool isToprate = false}) {
    return (select(movies)
          ..where((t) => t.upcoming.equals(isUpcoming))
          ..where((t) => t.popular.equals(isPopuler))
          ..where((t) => t.topRate.equals(isToprate)))
        .get();
  }

  Future<MovieEntry> getDataMovie(
      {int idMovie,
      bool isUpcoming = false,
      bool isPopuler = false,
      bool isToprate = false}) {
    return (select(movies)
          ..where((t) => t.idMovie.equals(idMovie))
          ..where((t) => t.upcoming.equals(isUpcoming))
          ..where((t) => t.popular.equals(isPopuler))
          ..where((t) => t.topRate.equals(isToprate)))
        .getSingle();
  }

  Future<TvEntry> getTvMovie(
      {int idMovie,
      bool isOnAir = false,
      bool isPopuler = false,
      bool isToprate = false}) {
    return (select(tv)
          ..where((t) => t.idMovie.equals(idMovie))
          ..where((t) => t.onAir.equals(isOnAir))
          ..where((t) => t.popular.equals(isPopuler))
          ..where((t) => t.topRate.equals(isToprate)))
        .getSingle();
  }

  void insertMovie(
      {List<Movie> datas,
      bool isPopuler = false,
      bool isUpcoming = false,
      bool isTopRate = false}) {
    if (datas.isNotEmpty) {
      datas.forEach((dt) async {
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
            upcoming: Value(isUpcoming),
            popular: Value(isPopuler),
            topRate: Value(isTopRate));

        await getDataMovie(
                idMovie: dt.id,
                isPopuler: isPopuler,
                isUpcoming: isUpcoming,
                isToprate: isTopRate)
            .then((dt) {
          if (dt == null) {
            insertSingleMovie(companion);
          }
        });
      });
    }
  }

  void insertMovieTv(
      {List<TvMovie> datas,
      bool isOnAir = false,
      bool isPopuler = false,
      bool isTop = false}) {
    if (datas.isNotEmpty) {
      datas.forEach((dt) async {
        TvCompanion companion = TvCompanion(
            originalName: Value(dt.originalName),
            idMovie: Value(dt.id),
            voteCount: Value(dt.voteCount),
            popularity: Value(dt.popularity),
            backdropPath: Value(dt.backdropPath),
            originalLanguage: Value(dt.originalLanguage),
            voteAverage: Value(dt.voteAverage),
            genreIds: Value(dt.genreIds.toString()),
            overview: Value(dt.overview),
            firstAirDate: Value(dt.firstAirDate),
            name: Value(dt.name),
            originCountry: Value(jsonEncode(dt.originCountry)),
            posterPath: Value(dt.posterPath),
            popular: Value(isPopuler),
            onAir: Value(isOnAir),
            topRate: Value(isTop));

        await getTvMovie(
                idMovie: dt.id,
                isPopuler: isPopuler,
                isOnAir: isOnAir,
                isToprate: isTop)
            .then((dt) {
          if (dt == null) {
            insertTvMovie(companion);
          }
        });
      });
    }
  }

}
