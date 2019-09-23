enum RequestType { Movie, Tv }

 String getRequestType(RequestType type) {
    switch (type) {
      case RequestType.Movie:
        return 'movie';
      case RequestType.Tv:
        return 'tv';
      default:
        return 'movie';
    }
  }