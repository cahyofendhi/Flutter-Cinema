import 'package:cinema_flt/models/tv/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class DetailTvState extends Equatable {
  final TV? movie;
  final FormzStatus status;

  const DetailTvState({
    this.movie,
    this.status = FormzStatus.pure,
  });

  DetailTvState copyWith({
    TV? movie,
    FormzStatus? status,
  }) =>
      DetailTvState(
        movie: movie ?? this.movie,
        status: status ?? FormzStatus.pure,
      );

  @override
  List<Object?> get props => [
        movie,
        status,
      ];
}
