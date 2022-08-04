import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object> get props => [];
}

class SearchInitEvent extends SearchEvent {}

class SubmitSearchEvent extends SearchEvent {
  final String query;

  SubmitSearchEvent(this.query);

  List<Object> get props => [query];
}
