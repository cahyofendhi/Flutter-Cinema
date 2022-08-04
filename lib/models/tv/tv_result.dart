import 'dart:convert';

// import 'package:cinema_flt/db/movie_db.dart';
import 'package:cinema_flt/models/tv/tv.dart';

class TvResult {
  final int? page;
  final int? totalResults;
  final int? totalPages;
  final List<TV>? results;

  TvResult({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory TvResult.fromJson(Map<String, dynamic> json) => TvResult(
        page: json['page'],
        totalResults: json['total_results'],
        totalPages: json['total_pages'],
        results: json['results'] != null
            ? List<TV>.from(json["results"].map((x) => TV.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results != null
          ? this.results!.map((v) => v.toJson()).toList()
          : null;
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
