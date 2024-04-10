import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_timer_state.dart';
part 'otp_timer_cubit.freezed.dart';

class OtpTimerCubit extends Cubit<OtpTimerState> {
  OtpTimerCubit() : super(const OtpTimerState.initial());
  late Timer _timer;
  int _secondsRemaining = 60;
  bool _isButtonEnabled = false;

  void startTimer() {
    emit(const OtpTimerState.startTime());
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          timer.cancel();
          dispose();

          _isButtonEnabled = true;
          emit(OtpTimerState.buttonState(buttonState: _isButtonEnabled));
        } else {
          _secondsRemaining--;
        }
        emit(OtpTimerState.counter(sec: _secondsRemaining));
      },
    );
  }

  void restartTimer() {
    emit(const OtpTimerState.restartTime());
    _secondsRemaining = 60;
    _isButtonEnabled = false;
    emit(OtpTimerState.buttonState(buttonState: _isButtonEnabled));
    startTimer();
  }

  void dispose() {
    _timer.cancel();
  }
}
