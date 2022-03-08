import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_golden_girls_api/golden_girls/home/model/golden_girls_model.dart';

import '../service/golden_girls_service.dart';

class GoldenGirlsCubit extends Cubit<GoldenGirlsState> {
  final IService service;
  List<GoldenGirlsModel>? model;
  bool isLoading = false;
  GoldenGirlsCubit({required this.service}) : super(HomeLoading()) {
    _init();
  }

  Future<void> _init() async {
    await fetchHomeData();
    emit(HomeCompleted(model: model));
  }

  Future<void> fetchHomeData() async {
    changeLoading();
    model = await service.fetchAllData();
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

abstract class GoldenGirlsState {}

class HomeLoading extends GoldenGirlsState {}

class HomeCompleted extends GoldenGirlsState {
  List<GoldenGirlsModel>? model;
  HomeCompleted({
    this.model,
  });
}
