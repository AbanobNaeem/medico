part of 'otp_timer_cubit.dart';

@freezed
class OtpTimerState with _$OtpTimerState {
  const factory OtpTimerState.initial() = _Initial;
  const factory OtpTimerState.startTime() = _StartTime;
  const factory OtpTimerState.counter({required int sec}) = _Counter;
  const factory OtpTimerState.buttonState({required bool buttonState}) = _ButtonState;
  const factory OtpTimerState.restartTime() = _RestartTime;
}
