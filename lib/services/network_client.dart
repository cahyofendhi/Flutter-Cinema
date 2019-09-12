
import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/services/service.dart';
// import 'package:logging/logging.dart';

class NetworkClient {
  final ChopperClient chopperClient;

  NetworkClient()
      : chopperClient = ChopperClient(
            baseUrl: BASE_URL,
            services: [Service.create()],
            // interceptors: [HttpLoggingInterceptor()],
            converter: JsonConverter()); 
    // Logger.root.level = Level.ALL;
    // Logger.root.onRecord.listen((rec) {
    //   print('${rec.level.name}: ${rec.time}: ${rec.message}');
    // });
  
}
