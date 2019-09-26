// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class MovieEntry extends DataClass implements Insertable<MovieEntry> {
  final int id;
  final bool video;
  final String posterPath;
  final int idMovie;
  final int voteCount;
  final double popularity;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final double voteAverage;
  final String genreIds;
  final String overview;
  final String releaseDate;
  final bool popular;
  final bool upcoming;
  final bool topRate;
  MovieEntry(
      {@required this.id,
      @required this.video,
      @required this.posterPath,
      @required this.idMovie,
      @required this.voteCount,
      @required this.popularity,
      @required this.adult,
      @required this.backdropPath,
      @required this.originalLanguage,
      @required this.originalTitle,
      @required this.title,
      @required this.voteAverage,
      @required this.genreIds,
      @required this.overview,
      @required this.releaseDate,
      @required this.popular,
      @required this.upcoming,
      @required this.topRate});
  factory MovieEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return MovieEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      video: boolType.mapFromDatabaseResponse(data['${effectivePrefix}video']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      idMovie:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_movie']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      popularity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      adult: boolType.mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      originalLanguage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      originalTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      voteAverage: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      genreIds: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}genre_ids']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      releaseDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
      popular:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}popular']),
      upcoming:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}upcoming']),
      topRate:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}top_rate']),
    );
  }
  factory MovieEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return MovieEntry(
      id: serializer.fromJson<int>(json['id']),
      video: serializer.fromJson<bool>(json['video']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      idMovie: serializer.fromJson<int>(json['idMovie']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      popularity: serializer.fromJson<double>(json['popularity']),
      adult: serializer.fromJson<bool>(json['adult']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      originalLanguage: serializer.fromJson<String>(json['originalLanguage']),
      originalTitle: serializer.fromJson<String>(json['originalTitle']),
      title: serializer.fromJson<String>(json['title']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      genreIds: serializer.fromJson<String>(json['genreIds']),
      overview: serializer.fromJson<String>(json['overview']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      popular: serializer.fromJson<bool>(json['popular']),
      upcoming: serializer.fromJson<bool>(json['upcoming']),
      topRate: serializer.fromJson<bool>(json['topRate']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'video': serializer.toJson<bool>(video),
      'posterPath': serializer.toJson<String>(posterPath),
      'idMovie': serializer.toJson<int>(idMovie),
      'voteCount': serializer.toJson<int>(voteCount),
      'popularity': serializer.toJson<double>(popularity),
      'adult': serializer.toJson<bool>(adult),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'originalTitle': serializer.toJson<String>(originalTitle),
      'title': serializer.toJson<String>(title),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'genreIds': serializer.toJson<String>(genreIds),
      'overview': serializer.toJson<String>(overview),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'popular': serializer.toJson<bool>(popular),
      'upcoming': serializer.toJson<bool>(upcoming),
      'topRate': serializer.toJson<bool>(topRate),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<MovieEntry>>(bool nullToAbsent) {
    return MoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      video:
          video == null && nullToAbsent ? const Value.absent() : Value(video),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      idMovie: idMovie == null && nullToAbsent
          ? const Value.absent()
          : Value(idMovie),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      genreIds: genreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(genreIds),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      popular: popular == null && nullToAbsent
          ? const Value.absent()
          : Value(popular),
      upcoming: upcoming == null && nullToAbsent
          ? const Value.absent()
          : Value(upcoming),
      topRate: topRate == null && nullToAbsent
          ? const Value.absent()
          : Value(topRate),
    ) as T;
  }

  MovieEntry copyWith(
          {int id,
          bool video,
          String posterPath,
          int idMovie,
          int voteCount,
          double popularity,
          bool adult,
          String backdropPath,
          String originalLanguage,
          String originalTitle,
          String title,
          double voteAverage,
          String genreIds,
          String overview,
          String releaseDate,
          bool popular,
          bool upcoming,
          bool topRate}) =>
      MovieEntry(
        id: id ?? this.id,
        video: video ?? this.video,
        posterPath: posterPath ?? this.posterPath,
        idMovie: idMovie ?? this.idMovie,
        voteCount: voteCount ?? this.voteCount,
        popularity: popularity ?? this.popularity,
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
        genreIds: genreIds ?? this.genreIds,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        popular: popular ?? this.popular,
        upcoming: upcoming ?? this.upcoming,
        topRate: topRate ?? this.topRate,
      );
  @override
  String toString() {
    return (StringBuffer('MovieEntry(')
          ..write('id: $id, ')
          ..write('video: $video, ')
          ..write('posterPath: $posterPath, ')
          ..write('idMovie: $idMovie, ')
          ..write('voteCount: $voteCount, ')
          ..write('popularity: $popularity, ')
          ..write('adult: $adult, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('title: $title, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('genreIds: $genreIds, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('popular: $popular, ')
          ..write('upcoming: $upcoming, ')
          ..write('topRate: $topRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          video.hashCode,
          $mrjc(
              posterPath.hashCode,
              $mrjc(
                  idMovie.hashCode,
                  $mrjc(
                      voteCount.hashCode,
                      $mrjc(
                          popularity.hashCode,
                          $mrjc(
                              adult.hashCode,
                              $mrjc(
                                  backdropPath.hashCode,
                                  $mrjc(
                                      originalLanguage.hashCode,
                                      $mrjc(
                                          originalTitle.hashCode,
                                          $mrjc(
                                              title.hashCode,
                                              $mrjc(
                                                  voteAverage.hashCode,
                                                  $mrjc(
                                                      genreIds.hashCode,
                                                      $mrjc(
                                                          overview.hashCode,
                                                          $mrjc(
                                                              releaseDate
                                                                  .hashCode,
                                                              $mrjc(
                                                                  popular
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      upcoming
                                                                          .hashCode,
                                                                      topRate
                                                                          .hashCode))))))))))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is MovieEntry &&
          other.id == id &&
          other.video == video &&
          other.posterPath == posterPath &&
          other.idMovie == idMovie &&
          other.voteCount == voteCount &&
          other.popularity == popularity &&
          other.adult == adult &&
          other.backdropPath == backdropPath &&
          other.originalLanguage == originalLanguage &&
          other.originalTitle == originalTitle &&
          other.title == title &&
          other.voteAverage == voteAverage &&
          other.genreIds == genreIds &&
          other.overview == overview &&
          other.releaseDate == releaseDate &&
          other.popular == popular &&
          other.upcoming == upcoming &&
          other.topRate == topRate);
}

class MoviesCompanion extends UpdateCompanion<MovieEntry> {
  final Value<int> id;
  final Value<bool> video;
  final Value<String> posterPath;
  final Value<int> idMovie;
  final Value<int> voteCount;
  final Value<double> popularity;
  final Value<bool> adult;
  final Value<String> backdropPath;
  final Value<String> originalLanguage;
  final Value<String> originalTitle;
  final Value<String> title;
  final Value<double> voteAverage;
  final Value<String> genreIds;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<bool> popular;
  final Value<bool> upcoming;
  final Value<bool> topRate;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.video = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.idMovie = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.popularity = const Value.absent(),
    this.adult = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.title = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.popular = const Value.absent(),
    this.upcoming = const Value.absent(),
    this.topRate = const Value.absent(),
  });
  MoviesCompanion copyWith(
      {Value<int> id,
      Value<bool> video,
      Value<String> posterPath,
      Value<int> idMovie,
      Value<int> voteCount,
      Value<double> popularity,
      Value<bool> adult,
      Value<String> backdropPath,
      Value<String> originalLanguage,
      Value<String> originalTitle,
      Value<String> title,
      Value<double> voteAverage,
      Value<String> genreIds,
      Value<String> overview,
      Value<String> releaseDate,
      Value<bool> popular,
      Value<bool> upcoming,
      Value<bool> topRate}) {
    return MoviesCompanion(
      id: id ?? this.id,
      video: video ?? this.video,
      posterPath: posterPath ?? this.posterPath,
      idMovie: idMovie ?? this.idMovie,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      genreIds: genreIds ?? this.genreIds,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      popular: popular ?? this.popular,
      upcoming: upcoming ?? this.upcoming,
      topRate: topRate ?? this.topRate,
    );
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, MovieEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _videoMeta = const VerificationMeta('video');
  GeneratedBoolColumn _video;
  @override
  GeneratedBoolColumn get video => _video ??= _constructVideo();
  GeneratedBoolColumn _constructVideo() {
    return GeneratedBoolColumn('video', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMovieMeta = const VerificationMeta('idMovie');
  GeneratedIntColumn _idMovie;
  @override
  GeneratedIntColumn get idMovie => _idMovie ??= _constructIdMovie();
  GeneratedIntColumn _constructIdMovie() {
    return GeneratedIntColumn(
      'id_movie',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  GeneratedRealColumn _popularity;
  @override
  GeneratedRealColumn get popularity => _popularity ??= _constructPopularity();
  GeneratedRealColumn _constructPopularity() {
    return GeneratedRealColumn(
      'popularity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  GeneratedBoolColumn _adult;
  @override
  GeneratedBoolColumn get adult => _adult ??= _constructAdult();
  GeneratedBoolColumn _constructAdult() {
    return GeneratedBoolColumn('adult', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  GeneratedTextColumn _originalLanguage;
  @override
  GeneratedTextColumn get originalLanguage =>
      _originalLanguage ??= _constructOriginalLanguage();
  GeneratedTextColumn _constructOriginalLanguage() {
    return GeneratedTextColumn(
      'original_language',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  GeneratedTextColumn _originalTitle;
  @override
  GeneratedTextColumn get originalTitle =>
      _originalTitle ??= _constructOriginalTitle();
  GeneratedTextColumn _constructOriginalTitle() {
    return GeneratedTextColumn(
      'original_title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  GeneratedRealColumn _voteAverage;
  @override
  GeneratedRealColumn get voteAverage =>
      _voteAverage ??= _constructVoteAverage();
  GeneratedRealColumn _constructVoteAverage() {
    return GeneratedRealColumn(
      'vote_average',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genreIdsMeta = const VerificationMeta('genreIds');
  GeneratedTextColumn _genreIds;
  @override
  GeneratedTextColumn get genreIds => _genreIds ??= _constructGenreIds();
  GeneratedTextColumn _constructGenreIds() {
    return GeneratedTextColumn(
      'genre_ids',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  GeneratedTextColumn _releaseDate;
  @override
  GeneratedTextColumn get releaseDate =>
      _releaseDate ??= _constructReleaseDate();
  GeneratedTextColumn _constructReleaseDate() {
    return GeneratedTextColumn(
      'release_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _popularMeta = const VerificationMeta('popular');
  GeneratedBoolColumn _popular;
  @override
  GeneratedBoolColumn get popular => _popular ??= _constructPopular();
  GeneratedBoolColumn _constructPopular() {
    return GeneratedBoolColumn('popular', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _upcomingMeta = const VerificationMeta('upcoming');
  GeneratedBoolColumn _upcoming;
  @override
  GeneratedBoolColumn get upcoming => _upcoming ??= _constructUpcoming();
  GeneratedBoolColumn _constructUpcoming() {
    return GeneratedBoolColumn('upcoming', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _topRateMeta = const VerificationMeta('topRate');
  GeneratedBoolColumn _topRate;
  @override
  GeneratedBoolColumn get topRate => _topRate ??= _constructTopRate();
  GeneratedBoolColumn _constructTopRate() {
    return GeneratedBoolColumn('top_rate', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        video,
        posterPath,
        idMovie,
        voteCount,
        popularity,
        adult,
        backdropPath,
        originalLanguage,
        originalTitle,
        title,
        voteAverage,
        genreIds,
        overview,
        releaseDate,
        popular,
        upcoming,
        topRate
      ];
  @override
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(MoviesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.video.present) {
      context.handle(
          _videoMeta, video.isAcceptableValue(d.video.value, _videoMeta));
    } else if (video.isRequired && isInserting) {
      context.missing(_videoMeta);
    }
    if (d.posterPath.present) {
      context.handle(_posterPathMeta,
          posterPath.isAcceptableValue(d.posterPath.value, _posterPathMeta));
    } else if (posterPath.isRequired && isInserting) {
      context.missing(_posterPathMeta);
    }
    if (d.idMovie.present) {
      context.handle(_idMovieMeta,
          idMovie.isAcceptableValue(d.idMovie.value, _idMovieMeta));
    } else if (idMovie.isRequired && isInserting) {
      context.missing(_idMovieMeta);
    }
    if (d.voteCount.present) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableValue(d.voteCount.value, _voteCountMeta));
    } else if (voteCount.isRequired && isInserting) {
      context.missing(_voteCountMeta);
    }
    if (d.popularity.present) {
      context.handle(_popularityMeta,
          popularity.isAcceptableValue(d.popularity.value, _popularityMeta));
    } else if (popularity.isRequired && isInserting) {
      context.missing(_popularityMeta);
    }
    if (d.adult.present) {
      context.handle(
          _adultMeta, adult.isAcceptableValue(d.adult.value, _adultMeta));
    } else if (adult.isRequired && isInserting) {
      context.missing(_adultMeta);
    }
    if (d.backdropPath.present) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableValue(
              d.backdropPath.value, _backdropPathMeta));
    } else if (backdropPath.isRequired && isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (d.originalLanguage.present) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableValue(
              d.originalLanguage.value, _originalLanguageMeta));
    } else if (originalLanguage.isRequired && isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (d.originalTitle.present) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableValue(
              d.originalTitle.value, _originalTitleMeta));
    } else if (originalTitle.isRequired && isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.voteAverage.present) {
      context.handle(_voteAverageMeta,
          voteAverage.isAcceptableValue(d.voteAverage.value, _voteAverageMeta));
    } else if (voteAverage.isRequired && isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (d.genreIds.present) {
      context.handle(_genreIdsMeta,
          genreIds.isAcceptableValue(d.genreIds.value, _genreIdsMeta));
    } else if (genreIds.isRequired && isInserting) {
      context.missing(_genreIdsMeta);
    }
    if (d.overview.present) {
      context.handle(_overviewMeta,
          overview.isAcceptableValue(d.overview.value, _overviewMeta));
    } else if (overview.isRequired && isInserting) {
      context.missing(_overviewMeta);
    }
    if (d.releaseDate.present) {
      context.handle(_releaseDateMeta,
          releaseDate.isAcceptableValue(d.releaseDate.value, _releaseDateMeta));
    } else if (releaseDate.isRequired && isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (d.popular.present) {
      context.handle(_popularMeta,
          popular.isAcceptableValue(d.popular.value, _popularMeta));
    } else if (popular.isRequired && isInserting) {
      context.missing(_popularMeta);
    }
    if (d.upcoming.present) {
      context.handle(_upcomingMeta,
          upcoming.isAcceptableValue(d.upcoming.value, _upcomingMeta));
    } else if (upcoming.isRequired && isInserting) {
      context.missing(_upcomingMeta);
    }
    if (d.topRate.present) {
      context.handle(_topRateMeta,
          topRate.isAcceptableValue(d.topRate.value, _topRateMeta));
    } else if (topRate.isRequired && isInserting) {
      context.missing(_topRateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MovieEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MoviesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.video.present) {
      map['video'] = Variable<bool, BoolType>(d.video.value);
    }
    if (d.posterPath.present) {
      map['poster_path'] = Variable<String, StringType>(d.posterPath.value);
    }
    if (d.idMovie.present) {
      map['id_movie'] = Variable<int, IntType>(d.idMovie.value);
    }
    if (d.voteCount.present) {
      map['vote_count'] = Variable<int, IntType>(d.voteCount.value);
    }
    if (d.popularity.present) {
      map['popularity'] = Variable<double, RealType>(d.popularity.value);
    }
    if (d.adult.present) {
      map['adult'] = Variable<bool, BoolType>(d.adult.value);
    }
    if (d.backdropPath.present) {
      map['backdrop_path'] = Variable<String, StringType>(d.backdropPath.value);
    }
    if (d.originalLanguage.present) {
      map['original_language'] =
          Variable<String, StringType>(d.originalLanguage.value);
    }
    if (d.originalTitle.present) {
      map['original_title'] =
          Variable<String, StringType>(d.originalTitle.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.voteAverage.present) {
      map['vote_average'] = Variable<double, RealType>(d.voteAverage.value);
    }
    if (d.genreIds.present) {
      map['genre_ids'] = Variable<String, StringType>(d.genreIds.value);
    }
    if (d.overview.present) {
      map['overview'] = Variable<String, StringType>(d.overview.value);
    }
    if (d.releaseDate.present) {
      map['release_date'] = Variable<String, StringType>(d.releaseDate.value);
    }
    if (d.popular.present) {
      map['popular'] = Variable<bool, BoolType>(d.popular.value);
    }
    if (d.upcoming.present) {
      map['upcoming'] = Variable<bool, BoolType>(d.upcoming.value);
    }
    if (d.topRate.present) {
      map['top_rate'] = Variable<bool, BoolType>(d.topRate.value);
    }
    return map;
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

class TvEntry extends DataClass implements Insertable<TvEntry> {
  final int id;
  final int idMovie;
  final String originalName;
  final String name;
  final double popularity;
  final int voteCount;
  final double voteAverage;
  final String firstAirDate;
  final String posterPath;
  final String originalLanguage;
  final String backdropPath;
  final String overview;
  final String genreIds;
  final String originCountry;
  final bool popular;
  final bool onAir;
  final bool topRate;
  TvEntry(
      {@required this.id,
      @required this.idMovie,
      @required this.originalName,
      @required this.name,
      @required this.popularity,
      @required this.voteCount,
      @required this.voteAverage,
      @required this.firstAirDate,
      @required this.posterPath,
      @required this.originalLanguage,
      @required this.backdropPath,
      @required this.overview,
      @required this.genreIds,
      @required this.originCountry,
      @required this.popular,
      @required this.onAir,
      @required this.topRate});
  factory TvEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    return TvEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idMovie:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_movie']),
      originalName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_name']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      popularity: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      voteCount:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}vote_count']),
      voteAverage: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average']),
      firstAirDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}first_air_date']),
      posterPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path']),
      originalLanguage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}original_language']),
      backdropPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backdrop_path']),
      overview: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}overview']),
      genreIds: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}genre_ids']),
      originCountry: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}origin_country']),
      popular:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}popular']),
      onAir: boolType.mapFromDatabaseResponse(data['${effectivePrefix}on_air']),
      topRate:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}top_rate']),
    );
  }
  factory TvEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TvEntry(
      id: serializer.fromJson<int>(json['id']),
      idMovie: serializer.fromJson<int>(json['idMovie']),
      originalName: serializer.fromJson<String>(json['originalName']),
      name: serializer.fromJson<String>(json['name']),
      popularity: serializer.fromJson<double>(json['popularity']),
      voteCount: serializer.fromJson<int>(json['voteCount']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      firstAirDate: serializer.fromJson<String>(json['firstAirDate']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      originalLanguage: serializer.fromJson<String>(json['originalLanguage']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      overview: serializer.fromJson<String>(json['overview']),
      genreIds: serializer.fromJson<String>(json['genreIds']),
      originCountry: serializer.fromJson<String>(json['originCountry']),
      popular: serializer.fromJson<bool>(json['popular']),
      onAir: serializer.fromJson<bool>(json['onAir']),
      topRate: serializer.fromJson<bool>(json['topRate']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'idMovie': serializer.toJson<int>(idMovie),
      'originalName': serializer.toJson<String>(originalName),
      'name': serializer.toJson<String>(name),
      'popularity': serializer.toJson<double>(popularity),
      'voteCount': serializer.toJson<int>(voteCount),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'firstAirDate': serializer.toJson<String>(firstAirDate),
      'posterPath': serializer.toJson<String>(posterPath),
      'originalLanguage': serializer.toJson<String>(originalLanguage),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'overview': serializer.toJson<String>(overview),
      'genreIds': serializer.toJson<String>(genreIds),
      'originCountry': serializer.toJson<String>(originCountry),
      'popular': serializer.toJson<bool>(popular),
      'onAir': serializer.toJson<bool>(onAir),
      'topRate': serializer.toJson<bool>(topRate),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<TvEntry>>(bool nullToAbsent) {
    return TvCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idMovie: idMovie == null && nullToAbsent
          ? const Value.absent()
          : Value(idMovie),
      originalName: originalName == null && nullToAbsent
          ? const Value.absent()
          : Value(originalName),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      voteCount: voteCount == null && nullToAbsent
          ? const Value.absent()
          : Value(voteCount),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      firstAirDate: firstAirDate == null && nullToAbsent
          ? const Value.absent()
          : Value(firstAirDate),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      originalLanguage: originalLanguage == null && nullToAbsent
          ? const Value.absent()
          : Value(originalLanguage),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      overview: overview == null && nullToAbsent
          ? const Value.absent()
          : Value(overview),
      genreIds: genreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(genreIds),
      originCountry: originCountry == null && nullToAbsent
          ? const Value.absent()
          : Value(originCountry),
      popular: popular == null && nullToAbsent
          ? const Value.absent()
          : Value(popular),
      onAir:
          onAir == null && nullToAbsent ? const Value.absent() : Value(onAir),
      topRate: topRate == null && nullToAbsent
          ? const Value.absent()
          : Value(topRate),
    ) as T;
  }

  TvEntry copyWith(
          {int id,
          int idMovie,
          String originalName,
          String name,
          double popularity,
          int voteCount,
          double voteAverage,
          String firstAirDate,
          String posterPath,
          String originalLanguage,
          String backdropPath,
          String overview,
          String genreIds,
          String originCountry,
          bool popular,
          bool onAir,
          bool topRate}) =>
      TvEntry(
        id: id ?? this.id,
        idMovie: idMovie ?? this.idMovie,
        originalName: originalName ?? this.originalName,
        name: name ?? this.name,
        popularity: popularity ?? this.popularity,
        voteCount: voteCount ?? this.voteCount,
        voteAverage: voteAverage ?? this.voteAverage,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        posterPath: posterPath ?? this.posterPath,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        backdropPath: backdropPath ?? this.backdropPath,
        overview: overview ?? this.overview,
        genreIds: genreIds ?? this.genreIds,
        originCountry: originCountry ?? this.originCountry,
        popular: popular ?? this.popular,
        onAir: onAir ?? this.onAir,
        topRate: topRate ?? this.topRate,
      );
  @override
  String toString() {
    return (StringBuffer('TvEntry(')
          ..write('id: $id, ')
          ..write('idMovie: $idMovie, ')
          ..write('originalName: $originalName, ')
          ..write('name: $name, ')
          ..write('popularity: $popularity, ')
          ..write('voteCount: $voteCount, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('firstAirDate: $firstAirDate, ')
          ..write('posterPath: $posterPath, ')
          ..write('originalLanguage: $originalLanguage, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('overview: $overview, ')
          ..write('genreIds: $genreIds, ')
          ..write('originCountry: $originCountry, ')
          ..write('popular: $popular, ')
          ..write('onAir: $onAir, ')
          ..write('topRate: $topRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idMovie.hashCode,
          $mrjc(
              originalName.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(
                      popularity.hashCode,
                      $mrjc(
                          voteCount.hashCode,
                          $mrjc(
                              voteAverage.hashCode,
                              $mrjc(
                                  firstAirDate.hashCode,
                                  $mrjc(
                                      posterPath.hashCode,
                                      $mrjc(
                                          originalLanguage.hashCode,
                                          $mrjc(
                                              backdropPath.hashCode,
                                              $mrjc(
                                                  overview.hashCode,
                                                  $mrjc(
                                                      genreIds.hashCode,
                                                      $mrjc(
                                                          originCountry
                                                              .hashCode,
                                                          $mrjc(
                                                              popular.hashCode,
                                                              $mrjc(
                                                                  onAir
                                                                      .hashCode,
                                                                  topRate
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TvEntry &&
          other.id == id &&
          other.idMovie == idMovie &&
          other.originalName == originalName &&
          other.name == name &&
          other.popularity == popularity &&
          other.voteCount == voteCount &&
          other.voteAverage == voteAverage &&
          other.firstAirDate == firstAirDate &&
          other.posterPath == posterPath &&
          other.originalLanguage == originalLanguage &&
          other.backdropPath == backdropPath &&
          other.overview == overview &&
          other.genreIds == genreIds &&
          other.originCountry == originCountry &&
          other.popular == popular &&
          other.onAir == onAir &&
          other.topRate == topRate);
}

class TvCompanion extends UpdateCompanion<TvEntry> {
  final Value<int> id;
  final Value<int> idMovie;
  final Value<String> originalName;
  final Value<String> name;
  final Value<double> popularity;
  final Value<int> voteCount;
  final Value<double> voteAverage;
  final Value<String> firstAirDate;
  final Value<String> posterPath;
  final Value<String> originalLanguage;
  final Value<String> backdropPath;
  final Value<String> overview;
  final Value<String> genreIds;
  final Value<String> originCountry;
  final Value<bool> popular;
  final Value<bool> onAir;
  final Value<bool> topRate;
  const TvCompanion({
    this.id = const Value.absent(),
    this.idMovie = const Value.absent(),
    this.originalName = const Value.absent(),
    this.name = const Value.absent(),
    this.popularity = const Value.absent(),
    this.voteCount = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.firstAirDate = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.originalLanguage = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.originCountry = const Value.absent(),
    this.popular = const Value.absent(),
    this.onAir = const Value.absent(),
    this.topRate = const Value.absent(),
  });
  TvCompanion copyWith(
      {Value<int> id,
      Value<int> idMovie,
      Value<String> originalName,
      Value<String> name,
      Value<double> popularity,
      Value<int> voteCount,
      Value<double> voteAverage,
      Value<String> firstAirDate,
      Value<String> posterPath,
      Value<String> originalLanguage,
      Value<String> backdropPath,
      Value<String> overview,
      Value<String> genreIds,
      Value<String> originCountry,
      Value<bool> popular,
      Value<bool> onAir,
      Value<bool> topRate}) {
    return TvCompanion(
      id: id ?? this.id,
      idMovie: idMovie ?? this.idMovie,
      originalName: originalName ?? this.originalName,
      name: name ?? this.name,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      voteAverage: voteAverage ?? this.voteAverage,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      posterPath: posterPath ?? this.posterPath,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      backdropPath: backdropPath ?? this.backdropPath,
      overview: overview ?? this.overview,
      genreIds: genreIds ?? this.genreIds,
      originCountry: originCountry ?? this.originCountry,
      popular: popular ?? this.popular,
      onAir: onAir ?? this.onAir,
      topRate: topRate ?? this.topRate,
    );
  }
}

class $TvTable extends Tv with TableInfo<$TvTable, TvEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $TvTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idMovieMeta = const VerificationMeta('idMovie');
  GeneratedIntColumn _idMovie;
  @override
  GeneratedIntColumn get idMovie => _idMovie ??= _constructIdMovie();
  GeneratedIntColumn _constructIdMovie() {
    return GeneratedIntColumn(
      'id_movie',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originalNameMeta =
      const VerificationMeta('originalName');
  GeneratedTextColumn _originalName;
  @override
  GeneratedTextColumn get originalName =>
      _originalName ??= _constructOriginalName();
  GeneratedTextColumn _constructOriginalName() {
    return GeneratedTextColumn(
      'original_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  GeneratedRealColumn _popularity;
  @override
  GeneratedRealColumn get popularity => _popularity ??= _constructPopularity();
  GeneratedRealColumn _constructPopularity() {
    return GeneratedRealColumn(
      'popularity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteCountMeta = const VerificationMeta('voteCount');
  GeneratedIntColumn _voteCount;
  @override
  GeneratedIntColumn get voteCount => _voteCount ??= _constructVoteCount();
  GeneratedIntColumn _constructVoteCount() {
    return GeneratedIntColumn(
      'vote_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  GeneratedRealColumn _voteAverage;
  @override
  GeneratedRealColumn get voteAverage =>
      _voteAverage ??= _constructVoteAverage();
  GeneratedRealColumn _constructVoteAverage() {
    return GeneratedRealColumn(
      'vote_average',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstAirDateMeta =
      const VerificationMeta('firstAirDate');
  GeneratedTextColumn _firstAirDate;
  @override
  GeneratedTextColumn get firstAirDate =>
      _firstAirDate ??= _constructFirstAirDate();
  GeneratedTextColumn _constructFirstAirDate() {
    return GeneratedTextColumn(
      'first_air_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  GeneratedTextColumn _posterPath;
  @override
  GeneratedTextColumn get posterPath => _posterPath ??= _constructPosterPath();
  GeneratedTextColumn _constructPosterPath() {
    return GeneratedTextColumn(
      'poster_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originalLanguageMeta =
      const VerificationMeta('originalLanguage');
  GeneratedTextColumn _originalLanguage;
  @override
  GeneratedTextColumn get originalLanguage =>
      _originalLanguage ??= _constructOriginalLanguage();
  GeneratedTextColumn _constructOriginalLanguage() {
    return GeneratedTextColumn(
      'original_language',
      $tableName,
      false,
    );
  }

  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  GeneratedTextColumn _backdropPath;
  @override
  GeneratedTextColumn get backdropPath =>
      _backdropPath ??= _constructBackdropPath();
  GeneratedTextColumn _constructBackdropPath() {
    return GeneratedTextColumn(
      'backdrop_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  GeneratedTextColumn _overview;
  @override
  GeneratedTextColumn get overview => _overview ??= _constructOverview();
  GeneratedTextColumn _constructOverview() {
    return GeneratedTextColumn(
      'overview',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genreIdsMeta = const VerificationMeta('genreIds');
  GeneratedTextColumn _genreIds;
  @override
  GeneratedTextColumn get genreIds => _genreIds ??= _constructGenreIds();
  GeneratedTextColumn _constructGenreIds() {
    return GeneratedTextColumn(
      'genre_ids',
      $tableName,
      false,
    );
  }

  final VerificationMeta _originCountryMeta =
      const VerificationMeta('originCountry');
  GeneratedTextColumn _originCountry;
  @override
  GeneratedTextColumn get originCountry =>
      _originCountry ??= _constructOriginCountry();
  GeneratedTextColumn _constructOriginCountry() {
    return GeneratedTextColumn(
      'origin_country',
      $tableName,
      false,
    );
  }

  final VerificationMeta _popularMeta = const VerificationMeta('popular');
  GeneratedBoolColumn _popular;
  @override
  GeneratedBoolColumn get popular => _popular ??= _constructPopular();
  GeneratedBoolColumn _constructPopular() {
    return GeneratedBoolColumn('popular', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _onAirMeta = const VerificationMeta('onAir');
  GeneratedBoolColumn _onAir;
  @override
  GeneratedBoolColumn get onAir => _onAir ??= _constructOnAir();
  GeneratedBoolColumn _constructOnAir() {
    return GeneratedBoolColumn('on_air', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _topRateMeta = const VerificationMeta('topRate');
  GeneratedBoolColumn _topRate;
  @override
  GeneratedBoolColumn get topRate => _topRate ??= _constructTopRate();
  GeneratedBoolColumn _constructTopRate() {
    return GeneratedBoolColumn('top_rate', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idMovie,
        originalName,
        name,
        popularity,
        voteCount,
        voteAverage,
        firstAirDate,
        posterPath,
        originalLanguage,
        backdropPath,
        overview,
        genreIds,
        originCountry,
        popular,
        onAir,
        topRate
      ];
  @override
  $TvTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tv';
  @override
  final String actualTableName = 'tv';
  @override
  VerificationContext validateIntegrity(TvCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.idMovie.present) {
      context.handle(_idMovieMeta,
          idMovie.isAcceptableValue(d.idMovie.value, _idMovieMeta));
    } else if (idMovie.isRequired && isInserting) {
      context.missing(_idMovieMeta);
    }
    if (d.originalName.present) {
      context.handle(
          _originalNameMeta,
          originalName.isAcceptableValue(
              d.originalName.value, _originalNameMeta));
    } else if (originalName.isRequired && isInserting) {
      context.missing(_originalNameMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.popularity.present) {
      context.handle(_popularityMeta,
          popularity.isAcceptableValue(d.popularity.value, _popularityMeta));
    } else if (popularity.isRequired && isInserting) {
      context.missing(_popularityMeta);
    }
    if (d.voteCount.present) {
      context.handle(_voteCountMeta,
          voteCount.isAcceptableValue(d.voteCount.value, _voteCountMeta));
    } else if (voteCount.isRequired && isInserting) {
      context.missing(_voteCountMeta);
    }
    if (d.voteAverage.present) {
      context.handle(_voteAverageMeta,
          voteAverage.isAcceptableValue(d.voteAverage.value, _voteAverageMeta));
    } else if (voteAverage.isRequired && isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (d.firstAirDate.present) {
      context.handle(
          _firstAirDateMeta,
          firstAirDate.isAcceptableValue(
              d.firstAirDate.value, _firstAirDateMeta));
    } else if (firstAirDate.isRequired && isInserting) {
      context.missing(_firstAirDateMeta);
    }
    if (d.posterPath.present) {
      context.handle(_posterPathMeta,
          posterPath.isAcceptableValue(d.posterPath.value, _posterPathMeta));
    } else if (posterPath.isRequired && isInserting) {
      context.missing(_posterPathMeta);
    }
    if (d.originalLanguage.present) {
      context.handle(
          _originalLanguageMeta,
          originalLanguage.isAcceptableValue(
              d.originalLanguage.value, _originalLanguageMeta));
    } else if (originalLanguage.isRequired && isInserting) {
      context.missing(_originalLanguageMeta);
    }
    if (d.backdropPath.present) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableValue(
              d.backdropPath.value, _backdropPathMeta));
    } else if (backdropPath.isRequired && isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (d.overview.present) {
      context.handle(_overviewMeta,
          overview.isAcceptableValue(d.overview.value, _overviewMeta));
    } else if (overview.isRequired && isInserting) {
      context.missing(_overviewMeta);
    }
    if (d.genreIds.present) {
      context.handle(_genreIdsMeta,
          genreIds.isAcceptableValue(d.genreIds.value, _genreIdsMeta));
    } else if (genreIds.isRequired && isInserting) {
      context.missing(_genreIdsMeta);
    }
    if (d.originCountry.present) {
      context.handle(
          _originCountryMeta,
          originCountry.isAcceptableValue(
              d.originCountry.value, _originCountryMeta));
    } else if (originCountry.isRequired && isInserting) {
      context.missing(_originCountryMeta);
    }
    if (d.popular.present) {
      context.handle(_popularMeta,
          popular.isAcceptableValue(d.popular.value, _popularMeta));
    } else if (popular.isRequired && isInserting) {
      context.missing(_popularMeta);
    }
    if (d.onAir.present) {
      context.handle(
          _onAirMeta, onAir.isAcceptableValue(d.onAir.value, _onAirMeta));
    } else if (onAir.isRequired && isInserting) {
      context.missing(_onAirMeta);
    }
    if (d.topRate.present) {
      context.handle(_topRateMeta,
          topRate.isAcceptableValue(d.topRate.value, _topRateMeta));
    } else if (topRate.isRequired && isInserting) {
      context.missing(_topRateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TvEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TvEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TvCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.idMovie.present) {
      map['id_movie'] = Variable<int, IntType>(d.idMovie.value);
    }
    if (d.originalName.present) {
      map['original_name'] = Variable<String, StringType>(d.originalName.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.popularity.present) {
      map['popularity'] = Variable<double, RealType>(d.popularity.value);
    }
    if (d.voteCount.present) {
      map['vote_count'] = Variable<int, IntType>(d.voteCount.value);
    }
    if (d.voteAverage.present) {
      map['vote_average'] = Variable<double, RealType>(d.voteAverage.value);
    }
    if (d.firstAirDate.present) {
      map['first_air_date'] =
          Variable<String, StringType>(d.firstAirDate.value);
    }
    if (d.posterPath.present) {
      map['poster_path'] = Variable<String, StringType>(d.posterPath.value);
    }
    if (d.originalLanguage.present) {
      map['original_language'] =
          Variable<String, StringType>(d.originalLanguage.value);
    }
    if (d.backdropPath.present) {
      map['backdrop_path'] = Variable<String, StringType>(d.backdropPath.value);
    }
    if (d.overview.present) {
      map['overview'] = Variable<String, StringType>(d.overview.value);
    }
    if (d.genreIds.present) {
      map['genre_ids'] = Variable<String, StringType>(d.genreIds.value);
    }
    if (d.originCountry.present) {
      map['origin_country'] =
          Variable<String, StringType>(d.originCountry.value);
    }
    if (d.popular.present) {
      map['popular'] = Variable<bool, BoolType>(d.popular.value);
    }
    if (d.onAir.present) {
      map['on_air'] = Variable<bool, BoolType>(d.onAir.value);
    }
    if (d.topRate.present) {
      map['top_rate'] = Variable<bool, BoolType>(d.topRate.value);
    }
    return map;
  }

  @override
  $TvTable createAlias(String alias) {
    return $TvTable(_db, alias);
  }
}

abstract class _$MovieDb extends GeneratedDatabase {
  _$MovieDb(QueryExecutor e) : super(SqlTypeSystem.withDefaults(), e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  $TvTable _tv;
  $TvTable get tv => _tv ??= $TvTable(this);
  @override
  List<TableInfo> get allTables => [movies, tv];
}
