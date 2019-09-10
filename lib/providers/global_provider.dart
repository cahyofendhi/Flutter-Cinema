import 'package:cinema_flt/bloc/home_block.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> globalProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(
    value: NetworkClient(),
  ),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<NetworkClient, Service>(
    builder: (context, client, service) => Service.create(client.chopperClient),
    dispose: (context, service) => service.client.dispose(),
  ),
  ProxyProvider<Service, MovieRepository>(
    builder: (context, service, movieRepository) => MovieRepository(service),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  ProxyProvider<MovieRepository, HomeBloc>(
    builder: (context, movieRepository, homeBloc) =>
        HomeBloc(movieRepository: movieRepository),
    dispose: (context, homeBloc) => homeBloc.dispose(),
  ),
];
