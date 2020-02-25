import 'package:moor_flutter/moor_flutter.dart';

part 'movie_db.g.dart';

@DataClassName('MovieEntry')
class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get video => boolean().withDefault(Constant(false))();
  TextColumn get posterPath => text()();
  IntColumn get idMovie => integer()();
  IntColumn get voteCount => integer()();
  RealColumn get popularity => real()();
  BoolColumn get adult => boolean().withDefault(Constant(false))();
  TextColumn get backdropPath => text()();
  TextColumn get originalLanguage => text()();
  TextColumn get originalTitle => text()();
  TextColumn get title => text()();
  RealColumn get voteAverage => real()();
  TextColumn get genreIds => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
  BoolColumn get popular => boolean().withDefault(Constant(false))();
  BoolColumn get upcoming => boolean().withDefault(Constant(false))();
  BoolColumn get topRate => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TvEntry')
class Tv extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idMovie => integer()();
  TextColumn get originalName => text()();
  TextColumn get name => text()();
  RealColumn get popularity => real()();
  IntColumn get voteCount => integer()();
  RealColumn get voteAverage => real()();
  TextColumn get firstAirDate => text()();
  TextColumn get posterPath => text()();
  TextColumn get originalLanguage => text()();
  TextColumn get backdropPath => text()();
  TextColumn get overview => text()();
  TextColumn get genreIds => text()();
  TextColumn get originCountry => text()();
  BoolColumn get popular => boolean().withDefault(Constant(false))();
  BoolColumn get onAir => boolean().withDefault(Constant(false))();
  BoolColumn get topRate => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Movies, Tv])
class MovieDb extends _$MovieDb {
  MovieDb()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
