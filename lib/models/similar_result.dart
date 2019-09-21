import 'package:cinema_flt/models/similar_movie_model.dart';

class SimilarResult {
  int page;
  List<SimilarMovieModel> results;
  int totalPages;
  int totalResults;

  SimilarResult({this.page, this.results, this.totalPages, this.totalResults});

  SimilarResult.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<SimilarMovieModel>();
      json['results'].forEach((v) {
        results.add(new SimilarMovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

