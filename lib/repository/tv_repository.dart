import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/models/tv/tv_result.dart';
import 'package:cinema_flt/repository/database_repository.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:dio/dio.dart';

enum TvGroup {
  TopRateTv,
  PopulerTv,
  LatestTv,
  OnAir,
}

class TvRepository {
  final Service _service;
  final DatabaseRepository _databaseRepository;

  TvRepository(service, databaseRepository)
      : _service = service,
        _databaseRepository = databaseRepository;

  Future<ServiceModel> getPopullerTv({int page = 1}) async {
    return await getTvList(TvGroup.PopulerTv, page);
  }

  Future<ServiceModel> getTopRateTv({int page = 1}) async {
    return await getTvList(TvGroup.TopRateTv, page);
  }

  Future<ServiceModel> getOnAirTv({int page = 1}) async {
    return await getTvList(TvGroup.OnAir, page);
  }

  Future<ServiceModel> getTvList(TvGroup group, int page) async {
    final ServiceModel result = ServiceModel();
    try {
      Response? response =
          await _service.getTvList(group: _getTvGroup(group), page: 1);
      if (response!.statusCode == Service.SUCCESS) {
        TvResult mResult = TvResult.fromJson(response.data);
        result.data = mResult;
        await insertTvMovie(
            datas: mResult.results!,
            isOnAir: group == TvGroup.OnAir,
            isPopuler: group == TvGroup.PopulerTv,
            isTopRate: group == TvGroup.TopRateTv);
      } else {
        result.errorMessage = response.statusMessage.toString();
        await getMovieFromDb(group).then((dt) => result.data = dt);
      }
    } catch (e) {
      result.errorMessage = e.toString();
      print('Caught ${e.toString()}');
      await getMovieFromDb(group).then((dt) => result.data = dt);
    }
    return result;
  }

  Future<ServiceModel> getTvDetail(int tvId) async {
    final ServiceModel result = ServiceModel<TV>();
    try {
      Response? response = await _service.getTvDetail(tvId: tvId);
      if (response!.statusCode == Service.SUCCESS) {
        TV mResult = TV.fromJson(response.data);
        result.data = mResult;
      } else {
        result.errorMessage = response.statusMessage.toString();
      }
    } catch (e) {
      print('error : $e');
      result.errorMessage = e.toString();
    }
    return result;
  }

  Future<void> insertTvMovie({
    required List<TV> datas,
    bool isPopuler = false,
    bool isOnAir = false,
    bool isTopRate = false,
  }) async {
    _databaseRepository.insertTvMovie(
        movies: datas,
        isOnAir: isOnAir,
        isPopuler: isPopuler,
        isTopRate: isTopRate);
  }

  Future<TvResult> getMovieFromDb(TvGroup group) async {
    List<TV> data = [];
    await _databaseRepository
        .getTvMovies(
            isOnAir: group == TvGroup.OnAir,
            isPopuler: group == TvGroup.PopulerTv,
            isTopRate: group == TvGroup.TopRateTv)
        .then((list) {
      data = list;
    });
    return TvResult(results: data);
  }

  String _getTvGroup(TvGroup group) {
    switch (group) {
      case TvGroup.LatestTv:
        return 'latest';
      case TvGroup.PopulerTv:
        return 'popular';
      case TvGroup.TopRateTv:
        return 'top_rated';
      case TvGroup.OnAir:
        return 'on_the_air';
      default:
        return 'latest';
    }
  }
}
