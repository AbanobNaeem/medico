import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nav_bar_state.dart';
part 'nav_bar_cubit.freezed.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarState.currentIndex(index: 0));

  int _currentIndex = 0;
  final int _initIndex = 0;

  int get getCurrentIndex => _currentIndex;

  set setCurrentIndex(int index) {
    if (index >= 0 && index <= 3) {
      _currentIndex = index;
    }
  }

  void onTap(index) {
    emit(NavBarState.currentIndex(index: index));
  }

  void restart() {
    _currentIndex = 0;
    emit(NavBarState.currentIndex(index: _initIndex));
  }

  void onPopInvoked() {
    emit(NavBarState.currentIndex(index: _initIndex));
  }
}
