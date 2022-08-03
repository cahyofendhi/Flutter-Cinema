// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TVAdapter extends TypeAdapter<TV> {
  @override
  final int typeId = 2;

  @override
  TV read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TV(
      backdropPath: fields[0] as String?,
      createdBy: (fields[1] as List?)?.cast<Cast>(),
      episodeRunTime: (fields[2] as List?)?.cast<int>(),
      firstAirDate: fields[3] as String?,
      genres: (fields[4] as List?)?.cast<Genres>(),
      genreIds: (fields[5] as List?)?.cast<int>(),
      homepage: fields[6] as String?,
      id: fields[7] as int?,
      inProduction: fields[8] as bool?,
      languages: (fields[9] as List?)?.cast<String>(),
      lastAirDate: fields[10] as String?,
      lastEpisodeToAir: fields[11] as LastEpisodeToAir?,
      name: fields[12] as String?,
      nextEpisodeToAir: fields[13] as int?,
      networks: (fields[14] as List?)?.cast<Networks>(),
      numberOfEpisodes: fields[15] as int?,
      numberOfSeasons: fields[16] as int?,
      originCountry: (fields[17] as List?)?.cast<String>(),
      originalLanguage: fields[18] as String?,
      originalName: fields[19] as String?,
      overview: fields[20] as String?,
      popularity: fields[21] as double?,
      posterPath: fields[22] as String?,
      productionCompanies: (fields[23] as List?)?.cast<ProductionCompanies>(),
      seasons: (fields[24] as List?)?.cast<Seasons>(),
      status: fields[25] as String?,
      type: fields[26] as String?,
      voteAverage: fields[27] as double?,
      voteCount: fields[28] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TV obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.createdBy)
      ..writeByte(2)
      ..write(obj.episodeRunTime)
      ..writeByte(3)
      ..write(obj.firstAirDate)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.genreIds)
      ..writeByte(6)
      ..write(obj.homepage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.inProduction)
      ..writeByte(9)
      ..write(obj.languages)
      ..writeByte(10)
      ..write(obj.lastAirDate)
      ..writeByte(11)
      ..write(obj.lastEpisodeToAir)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.nextEpisodeToAir)
      ..writeByte(14)
      ..write(obj.networks)
      ..writeByte(15)
      ..write(obj.numberOfEpisodes)
      ..writeByte(16)
      ..write(obj.numberOfSeasons)
      ..writeByte(17)
      ..write(obj.originCountry)
      ..writeByte(18)
      ..write(obj.originalLanguage)
      ..writeByte(19)
      ..write(obj.originalName)
      ..writeByte(20)
      ..write(obj.overview)
      ..writeByte(21)
      ..write(obj.popularity)
      ..writeByte(22)
      ..write(obj.posterPath)
      ..writeByte(23)
      ..write(obj.productionCompanies)
      ..writeByte(24)
      ..write(obj.seasons)
      ..writeByte(25)
      ..write(obj.status)
      ..writeByte(26)
      ..write(obj.type)
      ..writeByte(27)
      ..write(obj.voteAverage)
      ..writeByte(28)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TVAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
