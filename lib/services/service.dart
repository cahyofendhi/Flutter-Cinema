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

  @Get(path: 'tv/{group}')
  Future<Response> getTvList(@Path('group') String group,
      @Query() String api_key, @Query() int page);
}
