import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/models/tv/tv_result.dart';
import 'package:cinema_flt/services/service.dart';

enum TvGroup { 
  TopRateTv, 
  PopulerTv, 
  LatestTv, 
  OnAir,
}

class TvRepository {
  final Service _service;

  TvRepository(service) : _service = service;

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
          await _service.getTvList(_getTvGroup(group), API_KEY, 1);
      if (response.isSuccessful) {
        TvResult mResult = TvResult.fromJson(response.body);
        result.model = mResult;
        // await insertMovie(
        //     datas: mResult.results,
        //     isUpcoming: category == MovieCategory.Upcoming,
        //     isPopuler: category == MovieCategory.Populer,
        //     isTopRate: category == MovieCategory.TopRate);
      } else {
        result.errorMessage = response.error.toString();
        // await getMovieFromDb(category).then((dt) => result.model = dt);
      }
    } catch (e) {
      result.errorMessage = e.toString();
      print('Caught ${e.toString()}');
      // await getMovieFromDb(category).then((dt) => result.model = dt);
    }
    return result;
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
