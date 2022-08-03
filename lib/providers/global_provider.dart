import 'package:cinema_flt/repository/database_repository.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:cinema_flt/repository/tv_repository.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider(create: (_) => NetworkClient()),
  Provider(create: (_) => DatabaseRepository())
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<NetworkClient, Service>(
    update: (context, client, service) => Service(client),
  ),

  //! ================= REPOSITORY ====================
  ProxyProvider2<DatabaseRepository, Service, MovieRepository>(
      update: (context, dbRepository, service, movieRepository) =>
          MovieRepository(service, dbRepository)),
  ProxyProvider2<DatabaseRepository, Service, TvRepository>(
    update: (context, dbRepository, service, tvRepository) =>
        TvRepository(service, dbRepository),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];
