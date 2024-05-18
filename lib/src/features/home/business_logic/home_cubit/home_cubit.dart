import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/features/home/data/models/brain_tumor_model.dart';
import 'package:xpert/src/features/home/data/models/diseases_model.dart';
import 'package:xpert/src/features/home/data/models/get_doctor.dart';
import 'package:xpert/src/features/home/data/repo/diseases_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;

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
          emit(HomeState.uploadImageError(networkExceptions.toString()));
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
          emit(HomeState.uploadImageError(networkExceptions.toString()));
        },
      );
    } catch (e) {
      emit(HomeState.uploadImageError(e.toString()));
    }
  }

  Future<void> getDoctor(
      {required String speciality, required String governorate}) async {
    emit(const HomeState.getDoctorLoading());

    final result =
        await _repo.getDoctor(governorate: governorate, speciality: speciality);

    try {
      result.when(
        success: (data) {
          if (data.errorMessage == "Sorry No Data") {
            emit(const HomeState.getDoctorError("Sorry No Data"));
          } else {
            emit(HomeState.getDoctorSuccess(data: data));
          }
        },
        failure: (error) {
          emit(HomeState.getDoctorError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.getDoctorError(error.toString()));
    }
  }

  Future<void> getNurse({required String governorate}) async {
    emit(const HomeState.getNurseLoading());

    final result = await _repo.getNurse(governorate: governorate);

    try {
      result.when(
        success: (data) {
          log("$data");
          emit(HomeState.getNurseSuccess(data: data));
        },
        failure: (error) {
          emit(HomeState.getNurseError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.getNurseError(error.toString()));
    }
  }
}
