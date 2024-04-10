import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nav_bar_state.dart';
part 'nav_bar_cubit.freezed.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarState.initial());

  void onTap(index) {
    emit(NavBarState.currentIndex(index: index));
  }

  void onPopInvoked() {
    emit(const NavBarState.currentIndex(index: 0));
  }
}
