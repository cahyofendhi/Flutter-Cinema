import 'package:cinema_flt/bloc/home_bloc.dart';
import 'package:cinema_flt/bloc/tv_bloc.dart';
import 'package:cinema_flt/db/movie_db.dart';
import 'package:cinema_flt/db/movie_moor.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:cinema_flt/repository/tv_repository.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider(
    create: (_) => NetworkClient()
  ),
  Provider(
    create: (_) => MovieDb()
  )
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<NetworkClient, Service>(
    update: (context, client, service) => Service(client),
  ),
  ProxyProvider<MovieDb, MovieMoor>(
    update: (context, movieDb, movieMoor) => MovieMoor(movieDb),
  ),

  //! ================= REPOSITORY ====================
  ProxyProvider2<MovieMoor, Service, MovieRepository>(
      update: (context, movieMoor, service, movieRepository) =>
          MovieRepository(service, movieMoor)),
  ProxyProvider2<MovieMoor, Service, TvRepository>(
    update: (context, movieMoor, service, tvRepository) =>
        TvRepository(service, movieMoor),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [
  //? home bloc
  ProxyProvider<MovieRepository, HomeBloc>(
    update: (context, movieRepository, homeBloc) =>
        HomeBloc(movieRepository: movieRepository),
    dispose: (context, homeBloc) => homeBloc.dispose(),
  ),

  //? tv bloc
  ProxyProvider<TvRepository, TvBloc>(
    update: (context, tvRepository, tvBloc) =>
        TvBloc(tvRepository: tvRepository),
    dispose: (context, tvBloc) => tvBloc.dispose(),
  ),
];
