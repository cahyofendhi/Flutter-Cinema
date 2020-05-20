import 'dart:convert';

// import 'package:cinema_flt/db/movie_db.dart';
import 'package:cinema_flt/models/tv/tv.dart';

class TvResult {
  int page;
  int totalResults;
  int totalPages;
  List<TV> results;

  TvResult({this.page, this.totalResults, this.totalPages, this.results});

  TvResult.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<TV>();
      json['results'].forEach((v) {
        results.add(TV.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // static List<TV> fromDb(List<TvEntry> data) {
  //   List<TV> dataMovie = [];

  //   data.forEach((mv) {
  //     TV movie = TV(
  //       popularity: mv.popularity,
  //       voteCount: mv.voteCount,
  //       posterPath: mv.posterPath,
  //       id: mv.idMovie,
  //       backdropPath: mv.backdropPath,
  //       originalLanguage: mv.originalLanguage,
  //       genreIds:
  //           mv.genreIds.isEmpty ? [] : jsonDecode(mv.genreIds).cast<int>(),
  //       name: mv.name,
  //       voteAverage: mv.voteAverage,
  //       overview: mv.overview,
  //       firstAirDate: mv.firstAirDate,
  //       originalName: mv.originalName,
  //       originCountry:
  //           mv.originCountry.isEmpty ? [] : jsonDecode(mv.originCountry).cast<String>(),
  //     );
  //     dataMovie.add(movie);
  //   });

  //   return dataMovie;
  // }
}
