// import 'package:cinema_flt/db/movie_db.dart';
// import 'package:cinema_flt/db/movie_moor.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/models/tv/tv_detail.dart';
import 'package:cinema_flt/models/tv/tv_result.dart';
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
  // final MovieMoor _movieMoor;

  TvRepository(service)
      : _service = service;

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
      Response response =
          await _service.getTvList(_getTvGroup(group), 1);
      if (response.statusCode == Service.SUCCESS) {
        TvResult mResult = TvResult.fromJson(response.data);
        result.data = mResult;
        await insertTvMovie(
            datas: mResult.results,
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
      Response response = await _service.getTvDetail(tvId);
      if (response.statusCode == Service.SUCCESS) {
        TV mResult = TV.fromJson(response.data);
        result.data = mResult;
      } else {
        result.errorMessage = response.statusMessage.toString();
      }
    }catch (e) {
      print('error : $e');
      result.errorMessage = e.toString();
    }
    return result;
  }


  Future<void> insertTvMovie(
      {List<TV> datas,
      bool isPopuler = false,
      bool isOnAir = false,
      bool isTopRate = false}) async {
    // _movieMoor.insertMovieTv(
    //     datas: datas, isOnAir: isOnAir, isPopuler: isPopuler, isTop: isTopRate);
  }

  Future<TvResult> getMovieFromDb(TvGroup group) async {
    List<TV> data = [];
    // await _movieMoor
    //     .getMovieTvList(
    //         isOnAir: group == TvGroup.OnAir,
    //         isPopuler: group == TvGroup.PopulerTv,
    //         isTop: group == TvGroup.TopRateTv)
    //     .then((list) {
    //   data = TvResult.fromDb(list);
    // });
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
