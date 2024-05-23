import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/core/web_services/user_model.dart';
import 'package:xpert/src/features/auth/data/auth_repo.dart';

part 'auth_logic_state.dart';
part 'auth_logic_cubit.freezed.dart';

class AuthLogicCubit extends Cubit<AuthLogicState> {
  AuthLogicCubit(this._authRepo) : super(const AuthLogicState.initial());

  final AuthRepo _authRepo;

  void logIn({
    required String email,
    required String password,
  }) async {
    emit(const AuthLogicState.loading());
    try {
      final result = await _authRepo.logIn(
        email: email,
        password: password,
      );

      result.when(
        success: (model) {
          if (model.error != null) {
            emit(AuthLogicState.error(error: model.error!));
          } else {
            emit(AuthLogicState.success(model: model));
          }
        },
        failure: (DioExceptionTypes exceptionTypes) {
          emit(AuthLogicState.error(error: exceptionTypes.toString()));
        },
      );
    } catch (error) {
      emit(AuthLogicState.error(error: error.toString()));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(const AuthLogicState.loading());

    try {
      final result = await _authRepo.signUp(
        email: email,
        password: password,
        username: userName,
      );

      result.when(
        success: (UserModel model) {
          if (model.error != null) {
            emit(AuthLogicState.error(error: model.error!));
          } else {
            emit(AuthLogicState.success(model: model));
          }
        },
        failure: (DioExceptionTypes exceptionTypes) {
          emit(AuthLogicState.error(error: exceptionTypes.toString()));
        },
      );
    } catch (error) {
      emit(AuthLogicState.error(error: error.toString()));
    }
  }
}
