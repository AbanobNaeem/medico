part of 'auth_logic_cubit.dart';

@freezed
class AuthLogicState with _$AuthLogicState {
  const factory AuthLogicState.initial() = _Initial;

  const factory AuthLogicState.loading() = _Loading;
  const factory AuthLogicState.success({required UserModel model}) = _Success;
  const factory AuthLogicState.error({required String error}) = _Error;
  const factory AuthLogicState.errorInValidation({required Errors error}) = _ErrorInValidation;
}
