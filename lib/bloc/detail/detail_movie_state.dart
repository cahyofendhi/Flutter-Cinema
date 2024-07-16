import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/media_credit.dart';
import '../../models/movie/movie.dart';
import '../../models/similar_result.dart';

class DetailMovieState extends Equatable {
  final Movie? movie;
  final MediaCredit? credit;
  final SimilarResult? similiar;
  final FormzSubmissionStatus creditStatus;
  final FormzSubmissionStatus similiarStatus;

  const DetailMovieState({
    this.movie,
    this.credit,
    this.similiar,
    this.creditStatus = FormzSubmissionStatus.initial,
    this.similiarStatus = FormzSubmissionStatus.initial,
  });

  DetailMovieState copyWith({
    Movie? movie,
    MediaCredit? credit,
    SimilarResult? similiar,
    FormzSubmissionStatus? creditStatus,
    FormzSubmissionStatus? similiarStatus,
  }) =>
      DetailMovieState(
        movie: movie ?? this.movie,
        credit: credit ?? this.credit,
        similiar: similiar ?? this.similiar,
        creditStatus: creditStatus ?? FormzSubmissionStatus.initial,
        similiarStatus: similiarStatus ?? FormzSubmissionStatus.initial,
      );

  @override
  List<Object?> get props => [
        movie,
        credit,
        similiar,
        creditStatus,
        similiarStatus,
      ];
}
