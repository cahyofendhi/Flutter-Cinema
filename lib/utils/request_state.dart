

enum RequestState {
  DONE,
  LOADING,
  ERROR
}

class UiState {

  RequestState state;

  UiState([this.state = RequestState.LOADING]);

  @override
  String toString() => "State: $state";
}