import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/movie/movies_result.dart';

class HomeState extends Equatable {
  final MoviesResult? upcoming;
  final MoviesResult? popular;
  final MoviesResult? trending;
  final FormzSubmissionStatus upcomingStatus;
  final FormzSubmissionStatus popularStatus;
  final FormzSubmissionStatus trendingStatus;

  const HomeState({
    this.upcoming,
    this.popular,
    this.trending,
    this.upcomingStatus = FormzSubmissionStatus.initial,
    this.popularStatus = FormzSubmissionStatus.initial,
    this.trendingStatus = FormzSubmissionStatus.initial,
  });

  HomeState copyWith({
    MoviesResult? upcoming,
    MoviesResult? popular,
    MoviesResult? trending,
    FormzSubmissionStatus? upcomingStatus,
    FormzSubmissionStatus? popularStatus,
    FormzSubmissionStatus? trendingStatus,
  }) =>
      HomeState(
        popular: popular ?? this.popular,
        trending: trending ?? this.trending,
        upcoming: upcoming ?? this.upcoming,
        upcomingStatus: upcomingStatus ?? FormzSubmissionStatus.initial,
        popularStatus: popularStatus ?? FormzSubmissionStatus.initial,
        trendingStatus: trendingStatus ?? FormzSubmissionStatus.initial,
      );

  @override
  List<Object?> get props => [
        upcoming,
        popular,
        trending,
        upcomingStatus,
        popularStatus,
        trendingStatus,
      ];
}
