import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';
import 'package:xpert/src/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  final ProfileRepo _profileRepo;

  void getDoctorProfile({required int id}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.getDoctorProfile(id: id);
      result.when(
        success: (data) {
          emit(ProfileState.getDoctorProfile(model: data));
        },
        failure: (error) {
          emit(ProfileState.doctorProfileError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.doctorProfileError(error: error.toString()));
    }
  }

  void getUserProfile({required int id}) async {
    emit(const ProfileState.loading());

    try {
      var result = await _profileRepo.getUserProfile(id: id);
      result.when(
        success: (data) {
          emit(ProfileState.getUserProfile(model: data));
        },
        failure: (error) {
          emit(ProfileState.userProfileError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.userProfileError(error: error.toString()));
    }
  }

  void getNurseProfile({required int id}) async {
    emit(const ProfileState.loading());

    try {
      var result = await _profileRepo.getNurseProfile(id: id);
      result.when(
        success: (data) {
          emit(ProfileState.getNurseProfile(model: data));
        },
        failure: (error) {
          emit(ProfileState.nurseProfileError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.nurseProfileError(error: error.toString()));
    }
  }
}
