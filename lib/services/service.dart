import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/constant.dart';

part 'service.chopper.dart';

@ChopperApi(baseUrl: '$BASE_URL/3/')
abstract class Service extends ChopperService {

  @Get(path: 'movie/{category}')
  Future<Response> getUpcomingMovie(@Path('category') String category,
                                        @Query() String api_key,
                                        @Query() int page);

  static Service create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [
        _$Service(),
      ],
      converter: JsonConverter(),
    );
    return _$Service(client);
  }

}