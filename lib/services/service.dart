import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: '$BASE_URL/3/')
abstract class Service extends ChopperService {
  static Service create([ChopperClient client]) => _$Service(client);

  @Get(path: 'movie/{group}')
  Future<Response> getMovieList(@Path('group') String group,
      @Query() String api_key, @Query() int page);

  @Get(path: 'movie/{movieId}')
  Future<Response> getMovieDetail([@Path('movieId') int movieId, @Query() String api_key = API_KEY]);

  @Get(path: 'movie/{movieId}/credits')
  Future<Response> getMovieMediaCredit([@Path('movieId') int movieId, @Query() String api_key = API_KEY]);

  @Get(path: 'movie/{movieId}/similar')
  Future<Response> getMovieSimilar([@Path('movieId') int movieId, @Query() String api_key = API_KEY]);

  @Get(path: 'tv/{group}')
  Future<Response> getTvList(@Path('group') String group,
      @Query() String api_key, @Query() int page);
}
