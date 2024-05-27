import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/features/home/data/models/brain_tumor_model.dart';
import 'package:xpert/src/features/home/data/models/breast_cancer.dart';
import 'package:xpert/src/features/home/data/models/diseases_model.dart';
import 'package:xpert/src/features/home/data/models/get_doctor.dart';
import 'package:xpert/src/features/home/data/models/get_nurse_or_doctor_info.dart';
import 'package:xpert/src/features/home/data/models/top_doctor_model.dart';
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
        },
        failure: (networkExceptions) {
          emit(HomeState.uploadImageError(networkExceptions.toString()));
        },
      );
    } catch (e) {
      emit(HomeState.uploadImageError(e.toString()));
    }
  }

  void uploadOfBreastCancer(File imageFile) async {
    emit(const HomeState.uploadImageLoading());

    try {
      var result = await _repo.uploadOfBreastCancer(imageFile);
      result.when(
        success: (data) {
          emit(HomeState.uploadBreastCancerResult(data));
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

  Future<void> getNurseInfo({required int nurseId}) async {
    emit(const HomeState.getNurseInfoLoading());

    final result = await _repo.getNurseInfo(nurseId: nurseId);

    try {
      result.when(
        success: (data) {
          emit(HomeState.getNurseInfoSuccess(data: data));
        },
        failure: (error) {
          emit(HomeState.getNurseInfoError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.getNurseInfoError(error.toString()));
    }
  }

  Future<void> getDoctorInfo({required int doctorId}) async {
    emit(const HomeState.getDoctorInfoLoading());

    final result = await _repo.getDoctorInfo(doctorId: doctorId);

    try {
      result.when(
        success: (data) {
          emit(HomeState.getDoctorInfoSuccess(data: data));
        },
        failure: (error) {
          emit(HomeState.getDoctorInfoError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.getDoctorInfoError(error.toString()));
    }
  }

  Future<void> addRating({
    required int userId,
    required int doctorOrnursId,
    required int ratingValue,
  }) async {
    emit(const HomeState.addRatingLoading());

    final result = await _repo.addRating(
      userId: userId,
      doctorOrnursId: doctorOrnursId,
      ratingValue: ratingValue,
    );

    try {
      result.when(
        success: (data) {
          emit(const HomeState.addRatingSuccess());
        },
        failure: (error) {
          emit(HomeState.addRatingError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.addRatingError(error.toString()));
    }
  }

  Future<void> getTopDoctors() async {
    emit(const HomeState.getTopDoctorsLoading());

    final result = await _repo.getTopDoctors();

    try {
      result.when(
        success: (data) {
          emit(HomeState.getTopDoctorsSuccess(data));
        },
        failure: (error) {
          emit(HomeState.getTopDoctorsError(error.toString()));
        },
      );
    } catch (error) {
      emit(HomeState.getTopDoctorsError(error.toString()));
    }
  }
}
