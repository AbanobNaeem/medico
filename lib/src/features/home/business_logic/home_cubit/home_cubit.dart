import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/features/home/data/models/brain_tumor_model.dart';
import 'package:xpert/src/features/home/data/models/diseases_model.dart';
import 'package:xpert/src/features/home/data/repo/diseases_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final DiseasesRepo _repo;

  HomeCubit(this._repo) : super(const HomeState.initial());

  void uploadOfBonefractures(File imageFile) async {
    emit(const HomeState.uploadImageLoading());

    try {
      var result = await _repo.uploadOfBonefractures(imageFile);
      result.when(
        success: (data) {
          emit(HomeState.uploadBonefracturesResult(data));

          log("$result");
        },
        failure: (networkExceptions) {
          emit(
              HomeState.uploadImageError(networkExceptions.toString()));
        },
      );
    } catch (e) {
      emit(HomeState.uploadImageError(e.toString()));
    }
  }

  void uploadOfBrainTumor(File imageFile) async {
    emit(const HomeState.uploadImageLoading());

    try {
      var result = await _repo.uploadOfBrainTumor(imageFile);
      result.when(
        success: (data) {
          emit(HomeState.uploadBrainTumorResult(data));

          log("$result");
        },
        failure: (networkExceptions) {
          emit(
              HomeState.uploadImageError(networkExceptions.toString()));
        },
      );
    } catch (e) {
      emit(HomeState.uploadImageError(e.toString()));
    }
  }
}
