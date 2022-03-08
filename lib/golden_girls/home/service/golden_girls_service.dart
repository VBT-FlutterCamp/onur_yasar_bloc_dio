import 'package:dio/dio.dart';

import '../model/golden_girls_model.dart';

abstract class IService {
  final Dio dio;

  IService(
    this.dio,
  );

  Future<List<GoldenGirlsModel>?> fetchAllData();
}

class GoldenGirlsService extends IService {
  GoldenGirlsService(Dio dio) : super(dio);

  @override
  Future<List<GoldenGirlsModel>?> fetchAllData() async {
    final response =
        await dio.get("https://api.tvmaze.com/search/shows?q=golden%20girls");

    if (response.statusCode == 200) {
      final data = response.data as List;
      return data.map((e) => GoldenGirlsModel.fromJson(e)).toList();
    }
    return null;
  }
}
