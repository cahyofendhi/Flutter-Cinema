import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../models/movie/movies_result.dart';

class HomeState extends Equatable {
  final MoviesResult? upcoming;
  final MoviesResult? popular;
  final MoviesResult? trending;
  final FormzStatus upcomingStatus;
  final FormzStatus popularStatus;
  final FormzStatus trendingStatus;

  const HomeState({
    this.upcoming,
    this.popular,
    this.trending,
    this.upcomingStatus = FormzStatus.pure,
    this.popularStatus = FormzStatus.pure,
    this.trendingStatus = FormzStatus.pure,
  });

  HomeState copyWith({
    MoviesResult? upcoming,
    MoviesResult? popular,
    MoviesResult? trending,
    FormzStatus? upcomingStatus,
    FormzStatus? popularStatus,
    FormzStatus? trendingStatus,
  }) =>
      HomeState(
        popular: popular ?? this.popular,
        trending: trending ?? this.trending,
        upcoming: upcoming ?? this.upcoming,
        upcomingStatus: upcomingStatus ?? FormzStatus.pure,
        popularStatus: popularStatus ?? FormzStatus.pure,
        trendingStatus: trendingStatus ?? FormzStatus.pure,
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
