// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 1;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      belongsToCollection: fields[2] as BelongsToCollection?,
      budget: fields[3] as int?,
      genres: (fields[4] as List?)?.cast<Genres>(),
      homepage: fields[6] as String?,
      id: fields[7] as int?,
      imdbId: fields[8] as String?,
      originalLanguage: fields[9] as String?,
      originalTitle: fields[10] as String?,
      overview: fields[11] as String?,
      popularity: fields[12] as double?,
      posterPath: fields[13] as String?,
      productionCompanies: (fields[14] as List?)?.cast<ProductionCompanies>(),
      productionCountries: (fields[15] as List?)?.cast<ProductionCountries>(),
      releaseDate: fields[16] as String?,
      revenue: fields[17] as int?,
      runtime: fields[18] as int?,
      spokenLanguages: (fields[19] as List?)?.cast<SpokenLanguages>(),
      status: fields[20] as String?,
      tagline: fields[21] as String?,
      title: fields[22] as String?,
      video: fields[23] as bool?,
      voteAverage: fields[24] as double?,
      voteCount: fields[25] as int?,
      genreIds: (fields[5] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.belongsToCollection)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.genreIds)
      ..writeByte(6)
      ..write(obj.homepage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.imdbId)
      ..writeByte(9)
      ..write(obj.originalLanguage)
      ..writeByte(10)
      ..write(obj.originalTitle)
      ..writeByte(11)
      ..write(obj.overview)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.posterPath)
      ..writeByte(14)
      ..write(obj.productionCompanies)
      ..writeByte(15)
      ..write(obj.productionCountries)
      ..writeByte(16)
      ..write(obj.releaseDate)
      ..writeByte(17)
      ..write(obj.revenue)
      ..writeByte(18)
      ..write(obj.runtime)
      ..writeByte(19)
      ..write(obj.spokenLanguages)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(21)
      ..write(obj.tagline)
      ..writeByte(22)
      ..write(obj.title)
      ..writeByte(23)
      ..write(obj.video)
      ..writeByte(24)
      ..write(obj.voteAverage)
      ..writeByte(25)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
