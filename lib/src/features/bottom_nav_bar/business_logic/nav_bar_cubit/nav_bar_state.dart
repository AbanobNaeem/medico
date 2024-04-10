part of 'nav_bar_cubit.dart';

@freezed
class NavBarState with _$NavBarState {
  const factory NavBarState.initial() = _Initial;
  const factory NavBarState.currentIndex({required int index}) = _CurrentIndex;
}
