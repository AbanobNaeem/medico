import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';
import 'package:xpert/src/features/home/constants/diseases_constants.dart';

class DiseasesDetailsScreen extends StatefulWidget {
  final String title;
  const DiseasesDetailsScreen({
    super.key,
    required this.title,
  });

  @override
  State<DiseasesDetailsScreen> createState() => _DiseasesDetailsScreenState();
}

class _DiseasesDetailsScreenState extends State<DiseasesDetailsScreen> {
  late List<DiseasesDetailsModel> listOfContent;
  @override
  void initState() {
    super.initState();
    listOfContent = _listType();
  }

  List<DiseasesDetailsModel> _listType() {
    switch (widget.title) {
      case StringsManager.boneFractures:
        return boneFracturesList;
      case StringsManager.brainTumor:
        return brainTumorList;
      case StringsManager.cancer:
        return cancerList;
      case StringsManager.breastCancer:
        return breastCancerList;
      default:
        return boneFracturesList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  PreferredSizeWidget? _appBar() {
    return DefaultAppBar(
      title: widget.title,
      centerTitle: true,
    );
  }

  Widget _bottomExtendAppBar() {
    return BottomExtendAppBar(
      height: 0.05.sh,
    );
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bottomExtendAppBar(),
          18.verticalSpace,
          AppPaddingWidgetHorizontal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _cameraAndGalleryRow(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Text(
                    StringsManager.details,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ...List.generate(
                  listOfContent.length,
                  (index) =>
                      _bodyText(context, title: listOfContent[index].body),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraAndGalleryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _blueBox(
          StringsManager.takePhoto,
          AssetsManager.cameraIc,
        ),
        _blueBox(
          StringsManager.fromGallery,
          AssetsManager.galleryIc,
        ),
      ],
    );
  }

  Widget _blueBox(String title, String icon) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 151.w,
      height: 140.h,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: SvgPicture.asset(icon),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: StyleManager.getLightStyle(
                fontSize: FontSize.s18,
                color: ColorManager.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyText(context, {required String title}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _circle(),
          12.horizontalSpace,
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _circle() {
    return Container(
      width: 12.w,
      height: 12.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.black,
      ),
    );
  }
}
