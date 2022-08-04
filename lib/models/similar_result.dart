import 'package:cinema_flt/models/similar_movie_model.dart';

class SimilarResult {
  final int? page;
  final List<SimilarMovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  SimilarResult({this.page, this.results, this.totalPages, this.totalResults});

  factory SimilarResult.fromJson(Map<String, dynamic> json) => SimilarResult(
        page: json['page'],
        results: json['results'] != null
            ? List<SimilarMovieModel>.from(
                json["results"].map((x) => SimilarMovieModel.fromJson(x)))
            : [],
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );

  Map<String, dynamic> toJson() => {
        'page': this.page,
        'results': this.results != null
            ? this.results!.map((v) => v.toJson()).toList()
            : null,
        'total_pages': this.totalPages,
        'total_results': this.totalResults,
      };
}
