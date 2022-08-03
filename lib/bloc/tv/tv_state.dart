import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/tv/tv_result.dart';

class TvState extends Equatable {
  final TvResult? top;
  final TvResult? popular;
  final TvResult? onAir;
  final FormzStatus topStatus;
  final FormzStatus popularStatus;
  final FormzStatus onAirStatus;

  const TvState({
    this.top,
    this.popular,
    this.onAir,
    this.topStatus = FormzStatus.pure,
    this.popularStatus = FormzStatus.pure,
    this.onAirStatus = FormzStatus.pure,
  });

  TvState copyWith({
    TvResult? top,
    TvResult? popular,
    TvResult? onAir,
    FormzStatus? topStatus,
    FormzStatus? popularStatus,
    FormzStatus? onAirStatus,
  }) =>
      TvState(
        popular: popular ?? this.popular,
        top: top ?? this.top,
        onAir: onAir ?? this.onAir,
        topStatus: topStatus ?? FormzStatus.pure,
        popularStatus: popularStatus ?? FormzStatus.pure,
        onAirStatus: onAirStatus ?? FormzStatus.pure,
      );

  @override
  List<Object?> get props => [
        top,
        popular,
        onAir,
        topStatus,
        popularStatus,
        onAirStatus,
      ];
}
