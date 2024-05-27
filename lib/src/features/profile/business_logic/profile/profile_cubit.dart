import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/features/profile/data/models/profile_image.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';
import 'package:xpert/src/features/profile/data/models/put_model.dart';
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

  Future<void> addImage({required int id, required File image}) async {
    emit(const ProfileState.addImageLoading());

    try {
      var result = await _profileRepo.addImage(id: id, image: image);
      result.when(
        success: (data) {
          emit(ProfileState.addImageSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.addImageError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.addImageError(error: error.toString()));
    }
  }

  Future<void> updateDoctorUsername({required int id, required String newUsername}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorUsername(id: id, newUsername: newUsername);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorUsernameSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorUsernameError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorUsernameError(error: error.toString()));
    }
  }

  Future<void> updateDoctorSpeciality({required int id, required String speciality}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorSpeciality(id: id, speciality: speciality);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorSpecialitySuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorSpecialityError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorSpecialityError(error: error.toString()));
    }
  }

  Future<void> updateDoctorPhoneNum({required int id, required String phoneNum}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorPhoneNum(id: id, phoneNum: phoneNum);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorPhoneNumSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorPhoneNumError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorPhoneNumError(error: error.toString()));
    }
  }

  Future<void> updateDoctorWorkTime({required int id, required String workTime}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorWorkTime(id: id, workTime: workTime);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorWorkTimeSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorWorkTimeError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorWorkTimeError(error: error.toString()));
    }
  }

  Future<void> updateDoctorAddress({required int id, required String address}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorAddress(id: id, address: address);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorAddressSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorAddressError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorAddressError(error: error.toString()));
    }
  }

  Future<void> updateDoctorDescription({required int id, required String description}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorDescription(id: id, description: description);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorDescriptionSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorDescriptionError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorDescriptionError(error: error.toString()));
    }
  }

  Future<void> updateDoctorGovernorates({required int id, required String governorates}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateDoctorGovernorates(id: id, governorates: governorates);
      result.when(
        success: (data) {
          emit(ProfileState.updateDoctorGovernoratesSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateDoctorGovernoratesError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateDoctorGovernoratesError(error: error.toString()));
    }
  }

  Future<void> updateNurseUsername({required int id, required String newUsername}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNurseUsername(id: id, newUsername: newUsername);
      result.when(
        success: (data) {
          emit(ProfileState.updateNurseUsernameSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNurseUsernameError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNurseUsernameError(error: error.toString()));
    }
  }

  Future<void> updateNurseSpeciality({required int id, required String speciality}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNurseSpeciality(id: id, speciality: speciality);
      result.when(
        success: (data) {
          emit(ProfileState.updateNurseSpecialitySuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNurseSpecialityError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNurseSpecialityError(error: error.toString()));
    }
  }

  Future<void> updateNursePhoneNum({required int id, required String phoneNum}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNursePhoneNum(id: id, phoneNum: phoneNum);
      result.when(
        success: (data) {
          emit(ProfileState.updateNursePhoneNumSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNursePhoneNumError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNursePhoneNumError(error: error.toString()));
    }
  }

  Future<void> updateNurseWorkTime({required int id, required String workTime}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNurseWorkTime(id: id, workTime: workTime);
      result.when(
        success: (data) {
          emit(ProfileState.updateNurseWorkTimeSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNurseWorkTimeError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNurseWorkTimeError(error: error.toString()));
    }
  }

  Future<void> updateNursePriceperhour({required int id, required String priceperhour}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNursePriceperhour(id: id, priseperhour: priceperhour);
      result.when(
        success: (data) {
          emit(ProfileState.updateNursePriceperhourSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNursePriceperhourError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNursePriceperhourError(error: error.toString()));
    }
  }

  Future<void> updateNurseDescription({required int id, required String description}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNurseDescription(id: id, description: description);
      result.when(
        success: (data) {
          emit(ProfileState.updateNurseDescriptionSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNurseDescriptionError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNurseDescriptionError(error: error.toString()));
    }
  }

  Future<void> updateNurseGovernorates({required int id, required String governorates}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateNurseGovernorates(id: id, governorates: governorates);
      result.when(
        success: (data) {
          emit(ProfileState.updateNurseGovernoratesSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateNurseGovernoratesError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateNurseGovernoratesError(error: error.toString()));
    }
  }

  Future<void> updateUserUsername({required int id, required String newUsername}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.updateUserUsername(id: id, newUsername: newUsername);
      result.when(
        success: (data) {
          emit(ProfileState.updateUserUsernameSuccess(model: data));
        },
        failure: (error) {
          emit(ProfileState.updateUserUsernameError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.updateUserUsernameError(error: error.toString()));
    }
  }

  Future<void> changePassword({required int id, required String oldPassword, required String newPassword}) async {
    emit(const ProfileState.loading());
    try {
      var result = await _profileRepo.changePassword(id: id, oldPassword: oldPassword, newPassword: newPassword);
      result.when(
        success: (data) {
          emit(ProfileState.changePasswordSuccess(message: data));
        },
        failure: (error) {
          emit(ProfileState.changePasswordError(error: error.toString()));
        },
      );
    } catch (error) {
      emit(ProfileState.changePasswordError(error: error.toString()));
    }
  }
}
