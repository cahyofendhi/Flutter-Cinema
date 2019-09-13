class TvMovie {
  String originalName;
  int id;
  String name;
  double popularity;
  int voteCount;
  double voteAverage;
  String firstAirDate;
  String posterPath;
  List<int> genreIds;
  String originalLanguage;
  String backdropPath;
  String overview;
  List<String> originCountry;

  TvMovie(
      {this.originalName,
      this.id,
      this.name,
      this.popularity,
      this.voteCount,
      this.voteAverage,
      this.firstAirDate,
      this.posterPath,
      this.genreIds,
      this.originalLanguage,
      this.backdropPath,
      this.overview,
      this.originCountry});

  TvMovie.fromJson(Map<String, dynamic> json) {
    originalName = json['original_name'];
    id = json['id'];
    name = json['name'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'].toDouble();
    firstAirDate = json['first_air_date'];
    posterPath = json['poster_path'];
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    backdropPath = json['backdrop_path'];
    overview = json['overview'];
    originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this.originalName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['first_air_date'] = this.firstAirDate;
    data['poster_path'] = this.posterPath;
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['backdrop_path'] = this.backdropPath;
    data['overview'] = this.overview;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
