import 'package:cinema_flt/models/tv/tv.dart';

class TvResult {
  int page;
  int totalResults;
  int totalPages;
  List<Tv> results;

  TvResult({this.page, this.totalResults, this.totalPages, this.results});

  TvResult.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<Tv>();
      json['results'].forEach((v) {
        results.add(Tv.fromJson(v));
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
}