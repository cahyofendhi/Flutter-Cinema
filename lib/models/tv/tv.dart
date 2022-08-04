import 'package:cinema_flt/models/media_credit.dart';
import 'package:hive/hive.dart';

part 'tv.g.dart';

@HiveType(typeId: 2)
class TV extends HiveObject {
  @HiveField(0)
  String? backdropPath;
  @HiveField(1)
  List<Cast>? createdBy;
  @HiveField(2)
  List<int>? episodeRunTime;
  @HiveField(3)
  String? firstAirDate;
  @HiveField(4)
  List<Genres>? genres;
  @HiveField(5)
  List<int>? genreIds;
  @HiveField(6)
  String? homepage;
  @HiveField(7)
  int? id;
  @HiveField(8)
  bool? inProduction;
  @HiveField(9)
  List<String>? languages;
  @HiveField(10)
  String? lastAirDate;
  @HiveField(11)
  LastEpisodeToAir? lastEpisodeToAir;
  @HiveField(12)
  String? name;
  @HiveField(13)
  int? nextEpisodeToAir;
  @HiveField(14)
  List<Networks>? networks;
  @HiveField(15)
  int? numberOfEpisodes;
  @HiveField(16)
  int? numberOfSeasons;
  @HiveField(17)
  List<String>? originCountry;
  @HiveField(18)
  String? originalLanguage;
  @HiveField(19)
  String? originalName;
  @HiveField(20)
  String? overview;
  @HiveField(21)
  double? popularity;
  @HiveField(22)
  String? posterPath;
  @HiveField(23)
  List<ProductionCompanies>? productionCompanies;
  @HiveField(24)
  List<Seasons>? seasons;
  @HiveField(25)
  String? status;
  @HiveField(26)
  String? type;
  @HiveField(27)
  double? voteAverage;
  @HiveField(28)
  int? voteCount;

  TV(
      {this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.genreIds,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.seasons,
      this.status,
      this.type,
      this.voteAverage,
      this.voteCount});

  factory TV.fromJson(Map<String, dynamic> json) {
    final _genres = json['genres'] != null
        ? List<Genres>.from(json["genres"].map((x) => Genres.fromJson(x)))
        : null;
    return TV(
      backdropPath: json['backdrop_path'],
      createdBy: json['created_by'] != null
          ? List<Cast>.from(json["created_by"].map((x) => Cast.fromJson(x)))
          : null,
      episodeRunTime: json['episode_run_time'] != null
          ? json['episode_run_time'].cast<int>()
          : null,
      firstAirDate: json['first_air_date'],
      genres: _genres,
      genreIds: _genres != null ? _genres.map((dt) => dt.id!).toList() : null,
      homepage: json['homepage'] ?? '',
      id: json['id'] ?? 0,
      inProduction: json['in_production'] ?? false,
      languages:
          json['languages'] != null ? json['languages'].cast<String>() : null,
      lastAirDate: json['last_air_date'] ?? '',
      lastEpisodeToAir: json['last_episode_to_air'] != null
          ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
          : null,
      name: json['name'] ?? '',
      networks: json['networks'] != null
          ? List<Networks>.from(
              json["networks"].map((x) => Networks.fromJson(x)))
          : null,
      numberOfEpisodes: json['number_of_episodes'] ?? 0,
      numberOfSeasons: json['number_of_seasons'] ?? 0,
      originCountry: json['origin_country'] != null
          ? json['origin_country'].cast<String>()
          : null,
      originalLanguage: json['original_language'] ?? '',
      originalName: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity:
          json['popularity'] != null ? json['popularity'].toDouble() : 0.0,
      posterPath: json['poster_path'] ?? '',
      productionCompanies: json['production_companies'] != null
          ? List<ProductionCompanies>.from(json["production_companies"]
              .map((x) => ProductionCompanies.fromJson(x)))
          : null,
      seasons: json['seasons'] != null
          ? List<Seasons>.from(json["seasons"].map((x) => Seasons.fromJson(x)))
          : null,
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      voteAverage:
          json['vote_average'] != null ? json['vote_average'].toDouble() : 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.map((v) => v.toJson()).toList();
    }
    data['episode_run_time'] = this.episodeRunTime;
    data['first_air_date'] = this.firstAirDate;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['in_production'] = this.inProduction;
    data['languages'] = this.languages;
    data['last_air_date'] = this.lastAirDate;
    if (this.lastEpisodeToAir != null) {
      data['last_episode_to_air'] = this.lastEpisodeToAir!.toJson();
    }
    data['name'] = this.name;
    data['next_episode_to_air'] = this.nextEpisodeToAir;
    if (this.networks != null) {
      data['networks'] = this.networks!.map((v) => v.toJson()).toList();
    }
    data['number_of_episodes'] = this.numberOfEpisodes;
    data['number_of_seasons'] = this.numberOfSeasons;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (this.seasons != null) {
      data['seasons'] = this.seasons!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['type'] = this.type;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class LastEpisodeToAir {
  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  LastEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.seasonNumber,
      this.showId,
      this.stillPath,
      this.voteAverage,
      this.voteCount});

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'] ?? '';
    episodeNumber = json['episode_number'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    overview = json['overview'] ?? '';
    productionCode = json['production_code'] ?? '';
    seasonNumber = json['season_number'] ?? 0;
    showId = json['show_id'] ?? 0;
    stillPath = json['still_path'] ?? '';
    voteAverage = json['vote_average'] ?? 0.0;
    voteCount = json['vote_count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['production_code'] = this.productionCode;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class Networks {
  String? name;
  int? id;
  String? logoPath;
  String? originCountry;

  Networks({this.name, this.id, this.logoPath, this.originCountry});

  Networks.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? 0;
    logoPath = json['logo_path'] ?? '';
    originCountry = json['origin_country'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['origin_country'] = this.originCountry;
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
    id = json['id'] ?? '';
    logoPath = json['logo_path'] ?? '';
    name = json['name'] ?? '';
    originCountry = json['origin_country'] ?? '';
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

class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  Seasons(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber});

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'] ?? '';
    episodeCount = json['episode_count'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    overview = json['overview'] ?? '';
    posterPath = json['poster_path'] ?? '';
    seasonNumber = json['season_number'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_count'] = this.episodeCount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['season_number'] = this.seasonNumber;
    return data;
  }
}
