import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/constant.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: '$BASE_URL/3/')
abstract class Service extends ChopperService {
  static Service create([ChopperClient client]) => _$Service(client);

  @Get(path: 'movie/{category}')
  Future<Response> getMovieList(@Path('category') String category,
      @Query() String api_key, @Query() int page);
}
