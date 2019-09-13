// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$Service extends Service {
  _$Service([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = Service;

  Future<Response> getMovieList(String group, String api_key, int page) {
    final $url = 'https://api.themoviedb.org/3/movie/$group';
    final Map<String, dynamic> $params = {'api_key': api_key, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getTvList(String group, String api_key, int page) {
    final $url = 'https://api.themoviedb.org/3/tv/$group';
    final Map<String, dynamic> $params = {'api_key': api_key, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
