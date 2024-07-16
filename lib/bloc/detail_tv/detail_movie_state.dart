import 'package:cinema_flt/models/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class DetailTvState extends Equatable {
  final TV? movie;
  final FormzSubmissionStatus status;

  const DetailTvState({
    this.movie,
    this.status = FormzSubmissionStatus.initial,
  });

  DetailTvState copyWith({
    TV? movie,
    FormzSubmissionStatus? status,
  }) =>
      DetailTvState(
        movie: movie ?? this.movie,
        status: status ?? FormzSubmissionStatus.initial,
      );

  @override
  List<Object?> get props => [
        movie,
        status,
      ];
}
