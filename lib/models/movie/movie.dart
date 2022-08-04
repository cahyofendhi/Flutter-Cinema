import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie extends HiveObject {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  BelongsToCollection? belongsToCollection;
  @HiveField(3)
  int? budget;
  @HiveField(4)
  List<Genres>? genres;
  @HiveField(5)
  List<int>? genreIds;
  @HiveField(6)
  String? homepage;
  @HiveField(7)
  int? id;
  @HiveField(8)
  String? imdbId;
  @HiveField(9)
  String? originalLanguage;
  @HiveField(10)
  String? originalTitle;
  @HiveField(11)
  String? overview;
  @HiveField(12)
  double? popularity;
  @HiveField(13)
  String? posterPath;
  @HiveField(14)
  List<ProductionCompanies>? productionCompanies;
  @HiveField(15)
  List<ProductionCountries>? productionCountries;
  @HiveField(16)
  String? releaseDate;
  @HiveField(17)
  int? revenue;
  @HiveField(18)
  int? runtime;
  @HiveField(19)
  List<SpokenLanguages>? spokenLanguages;
  @HiveField(20)
  String? status;
  @HiveField(21)
  String? tagline;
  @HiveField(22)
  String? title;
  @HiveField(23)
  bool? video;
  @HiveField(24)
  double? voteAverage;
  @HiveField(25)
  int? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.genreIds});

  String getReleaseDate() {
    return releaseDate != null && releaseDate?.isNotEmpty == true
        ? convertDate(releaseDate!)
        : '';
  }

  factory Movie.fromDetailJson(Map<String, dynamic> json) {
    final _genres = json['genres'] != null
        ? List<Genres>.from(json["genres"].map((x) => Genres.fromJson(x)))
        : null;
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: _genres,
      genreIds: _genres != null ? _genres.map((dt) => dt.id!).toList() : null,
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] != null
          ? List<ProductionCompanies>.from(json["production_companies"]
              .map((x) => ProductionCompanies.fromJson(x)))
          : null,
      productionCountries: json['production_countries'] != null
          ? List<ProductionCountries>.from(json["production_countries"]
              .map((x) => ProductionCountries.fromJson(x)))
          : null,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages'] != null
          ? List<SpokenLanguages>.from(
              json["spoken_languages"].map((x) => SpokenLanguages.fromJson(x)))
          : null,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toDetailJson() => {
        'adult': this.adult,
        'backdrop_path': this.backdropPath,
        'belongs_to_collection': this.belongsToCollection?.toJson(),
        'budget': this.budget,
        'genres': this.genres != null
            ? this.genres!.map((v) => v.toJson()).toList()
            : null,
        'homepage': this.homepage,
        'id': this.id,
        'imdb_id': this.imdbId,
        'original_language': this.originalLanguage,
        'original_title': this.originalTitle,
        'overview': this.overview,
        'popularity': this.popularity,
        'poster_path': this.posterPath,
        'production_companies': this.productionCompanies != null
            ? this.productionCompanies!.map((v) => v.toJson()).toList()
            : null,
        'production_countries': this.productionCountries != null
            ? this.productionCountries!.map((v) => v.toJson()).toList()
            : null,
        'release_date': this.releaseDate,
        'revenue': this.revenue,
        'runtime': this.runtime,
        'spoken_languages': this.spokenLanguages != null
            ? this.spokenLanguages!.map((v) => v.toJson()).toList()
            : null,
        'status': this.status,
        'tagline': this.tagline,
        'title': this.title,
        'video': this.video,
        'vote_average': this.voteAverage,
        'vote_count': this.voteCount,
      };

  Movie.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'].toDouble();
    voteCount = json['vote_count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'].toDouble();
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }

  @override
  List<Object> get props => throw UnimplementedError();
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String? iso6391;
  String? name;

  SpokenLanguages({this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
