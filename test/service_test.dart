// import 'dart:convert';
// import 'dart:developer';

// import 'package:cinema_flt/models/media_credit.dart';
// import 'package:cinema_flt/models/movie/movie.dart';
// import 'package:cinema_flt/models/movie/movies_result.dart';
// import 'package:cinema_flt/models/similar_result.dart';
// import 'package:dio/dio.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';
// import 'package:cinema_flt/services/service.dart';

// import 'resource/fake_response.dart';

// class MockService extends Mock implements Service {}

// void main() {
//   group(
//     'fetch movie',
//     () {
//       final service = MockService();

//       setUp(() {});

//       //! movie list
//       test(
//         'return movie list when request complete',
//         () async {
//           const category = "popular";
//           when(service.getMovieList(category, 1)).thenAnswer(
//             (_) async => Response(
//                 data: fakeResponseMovieList, statusCode: Service.SUCCESS),
//           );
//           var response = await service.getMovieList(category, 1);
//           MoviesResult result =
//               MoviesResult.fromJson(json.decode(response.data));
//           expect(response, const TypeMatcher<Response>());
//           expect(result.results.length, 1);
//         },
//       );

//       //! movie detail
//       test(
//         'return movie detail when request complete',
//         () async {
//           const movieId = 429203;
//           when(service.getMovieDetail(movieId)).thenAnswer(
//             (_) async => Response(
//                 data: fakeResponseMovieDetail, statusCode: Service.SUCCESS),
//           );
//           var response = await service.getMovieDetail(movieId);
//           Movie result = Movie.fromDetailJson(json.decode(response.data));
//           expect(response, const TypeMatcher<Response>());
//           expect(result.id, movieId);
//         },
//       );

//       //! movie similar
//       test(
//         'return movie similar when request complete',
//         () async {
//           const movieId = 474350;
//           when(service.getMovieSimilar(movieId)).thenAnswer(
//             (_) async => Response(
//                 data: fakeResponseMovieSimilar, statusCode: Service.SUCCESS),
//           );
//           var response = await service.getMovieSimilar(movieId);
//           SimilarResult result = SimilarResult.fromJson(json.decode(response.data));
//           expect(response, const TypeMatcher<Response>());
//           expect(result.results.length, 1);
//         },
//       );

//       //! movie credit
//       test(
//         'return movie media credit when request complete',
//         () async {
//           const movieId = 474350;
//           when(service.getMovieMediaCredit(movieId)).thenAnswer(
//             (_) async => Response(
//                 data: fakeResponseMovieCredit, statusCode: Service.SUCCESS),
//           );
//           var response = await service.getMovieMediaCredit(movieId);
//           MediaCredit result = MediaCredit.fromJson(json.decode(response.data));
//           expect(response, const TypeMatcher<Response>());
//           expect(result.id, movieId);
//         },
//       );


//     },
//   );
// }
