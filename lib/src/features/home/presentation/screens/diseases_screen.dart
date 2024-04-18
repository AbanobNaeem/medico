import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/values_manager.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';
import 'package:xpert/src/features/home/constants/diseases_constants.dart';

class DiseasesScreen extends StatefulWidget {
  const DiseasesScreen({super.key});

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget? _appBar() {
    return DefaultAppBar(
      title: StringsManager.diseases,
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: SvgPicture.asset(
            width: 17.w,
            height: 17.h,
            AssetsManager.searchIc,
            colorFilter: const ColorFilter.mode(
              ColorManager.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomExtendAppBar() {
    return BottomExtendAppBar(
      height: 0.05.sh,
    );
  }

  Widget _body() {
    return Column(
      children: [
        _bottomExtendAppBar(),
        ...List.generate(
          diseasesList.length,
          (index) => _box(
            diseasesList[index],
          ),
        ),
      ],
    );
  }

  Widget _box(DiseasesModel model) {
    return InkWell(
      onTap: model.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: AppPadding.p16.w,
        ),
        height: 142.h,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                width: 122.w,
                height: 115.38.h,
                model.image,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(model.title,
                  style: StyleManager.getMediumStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
