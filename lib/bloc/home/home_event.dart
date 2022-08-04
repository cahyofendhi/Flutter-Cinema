import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeUpcomingEvent extends HomeEvent {}

class HomePopularEvent extends HomeEvent {}

class HomeTrendingEvent extends HomeEvent {}
