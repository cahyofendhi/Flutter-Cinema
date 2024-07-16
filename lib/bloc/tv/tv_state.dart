import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/tv/tv_result.dart';

class TvState extends Equatable {
  final TvResult? top;
  final TvResult? popular;
  final TvResult? onAir;
  final FormzSubmissionStatus topStatus;
  final FormzSubmissionStatus popularStatus;
  final FormzSubmissionStatus onAirStatus;

  const TvState({
    this.top,
    this.popular,
    this.onAir,
    this.topStatus = FormzSubmissionStatus.initial,
    this.popularStatus = FormzSubmissionStatus.initial,
    this.onAirStatus = FormzSubmissionStatus.initial,
  });

  TvState copyWith({
    TvResult? top,
    TvResult? popular,
    TvResult? onAir,
    FormzSubmissionStatus? topStatus,
    FormzSubmissionStatus? popularStatus,
    FormzSubmissionStatus? onAirStatus,
  }) =>
      TvState(
        popular: popular ?? this.popular,
        top: top ?? this.top,
        onAir: onAir ?? this.onAir,
        topStatus: topStatus ?? FormzSubmissionStatus.initial,
        popularStatus: popularStatus ?? FormzSubmissionStatus.initial,
        onAirStatus: onAirStatus ?? FormzSubmissionStatus.initial,
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
