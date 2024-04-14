import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/values_manager.dart';
import 'package:xpert/src/features/bottom_nav_bar/constants/nav_bar_constants.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required int currentIndex,
    void Function(int)? onTap,
  })  : _onTap = onTap,
        _currentIndex = currentIndex;

  final int _currentIndex;
  final ValueChanged<int>? _onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: AppMargin.m30.h,
          ),
          width: 343.w,
          height: 58.h,
          decoration: BoxDecoration(
              color: ColorManager.white,
              border: Border.all(color: ColorManager.royalBlue),
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: ListView.separated(
            padding: EdgeInsetsDirectional.only(start: 39.w, end: 28.w),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                _barItem(currentIndex: _currentIndex, index: index),
            separatorBuilder: (context, index) {
              switch (index) {
                case 0:
                  return 36.horizontalSpace;
                case 1:
                  return 111.horizontalSpace;
                case 2:
                  return 36.horizontalSpace;
                default:
                  return 111.horizontalSpace;
              }
            },
            itemCount: navBarItems.length,
          ),
        ),
        _buildRobotIcon(context),
      ],
    );
  }

  Widget _buildRobotIcon(context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.chatBotLockScreen),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: Container(
              color: ColorManager.white,
              width: 67.36.w,
              height: 57.h,
            ),
          ),
          CircleAvatar(
            radius: 27.5.r,
            backgroundColor: ColorManager.bluishPurple,
            child: SvgPicture.asset(AssetsManager.robotIc),
          ),
        ],
      ),
    );
  }

  Widget _barItem({required int currentIndex, required int index}) {
    return InkWell(
      onTap: () {
        _onTap?.call(index);
      },
      child: _iconBuilder(
        selectedAsset: navBarItems[index].selectedAsset,
        unselectedAsset: navBarItems[index].unselectedAsset,
        isSelected: currentIndex == navBarItems[index].index,
      ),
    );
  }

  Widget _iconBuilder({
    required String selectedAsset,
    required String unselectedAsset,
    required bool isSelected,
  }) {
    return SizedBox(
      width: 24.w,
      height: 24.h,
      child: SvgPicture.asset(
        isSelected ? selectedAsset : unselectedAsset,
      ),
    );
  }
}
