import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/features/bottom_nav_bar/business_logic/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:xpert/src/features/bottom_nav_bar/constants/nav_bar_constants.dart';
import 'package:xpert/src/features/bottom_nav_bar/presentation/widgets/nav_bar_widget.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildNavBloc();
  }

  Widget _buildNavBloc() {
    int currentIndex = 0;
    return BlocConsumer<NavBarCubit, NavBarState>(
      listener: (context, state) {
        state.mapOrNull(
          currentIndex: (state) => currentIndex = state.index,
        );
      },
      builder: (context, state) => _buildBody(
        currentIndex: currentIndex,
        onPopInvoked: (didPop) => RouteGenerator.navBarCubit.onPopInvoked(),
        onTap: (index) => RouteGenerator.navBarCubit.onTap(index),
      ),
    );
  }

  Widget _buildBody({
    void Function(bool)? onPopInvoked,
    required int currentIndex,
    void Function(int)? onTap,
  }) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            navBarPages[currentIndex],
            SafeArea(
              child: NavBarWidget(
                currentIndex: currentIndex,
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
