import 'package:intl/intl.dart';

Map<int, String> _genreMap = {
  28: 'Action',
  12: 'Adventure',
  16: 'Animation',
  35: 'Comedy',
  80: 'Crime',
  99: 'Documentary',
  18: 'Drama',
  10751: 'Family',
  10762: 'Kids',
  10759: 'Action & Adventure',
  14: 'Fantasy',
  36: 'History',
  27: 'Horror',
  10402: 'Music',
  9648: 'Mystery',
  10749: 'Romance',
  878: 'Science Fiction',
  10770: 'TV Movie',
  53: 'Thriller',
  10752: 'War',
  37: 'Western',
  10763: '',
  10764: 'Reality',
  10765: 'Sci-Fi & Fantasy',
  10766: 'Soap',
  10767: 'Talk',
  10768: 'War & Politics',
};

List<String> getGenresForIds(List<int> genreIds) =>
    genreIds.map((id) => _genreMap[id] ?? '').toList();

String getGenreString(List<int> genreIds) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(getGenresForIds(genreIds), ", ");
  return buffer.toString();
}

String getImageTheMovie(String name) {
  return 'http://image.tmdb.org/t/p/w185/$name';
}

String convertDate(String str) {
  DateTime date = DateTime.parse(str);
  var formatter = new DateFormat('dd/MMM/yyyy');
  return formatter.format(date);
}

String getTheMovieImage(String path) {
  return 'http://image.tmdb.org/t/p/w185/$path';
}

const DEKSTOP = 1254.0 / 3.5;
const TABLET = 900.0 / 2.5;
