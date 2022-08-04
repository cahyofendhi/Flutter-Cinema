import 'package:cinema_flt/models/movie/movie.dart';

import '../dates.dart';

class MoviesResult {
  final List<Movie> results;
  final int? page;
  final int? totalResults;
  final Dates? dates;
  final int? totalPages;

  MoviesResult(
      {this.results = const [],
      this.page,
      this.totalResults,
      this.dates,
      this.totalPages});

  factory MoviesResult.fromJson(Map<String, dynamic> json) => MoviesResult(
        results: json['results'] != null
            ? List<Movie>.from(json["results"].map((x) => Movie.fromJson(x)))
            : [],
        page: json['page'],
        totalPages: json['total_results'],
        dates: json['dates'] != null ? new Dates.fromJson(json['dates']) : null,
        totalResults: json['total_pages'],
      );

  Map<String, dynamic> toJson() => {
        "results": results.map((v) => v.toJson()).toList(),
        "page": page,
        "total_results": totalResults,
        "dates": dates?.toJson(),
        "total_pages": totalPages,
      };
}
