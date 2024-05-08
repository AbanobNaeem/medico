import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:xpert/src/features/home/data/constants/diseases_constants.dart';

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
  late ImagePicker _imagePicker;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    listOfContent = _listType();
    _imagePicker = ImagePicker();
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
      body: _bodyBloc(),
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

  Widget _bodyBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.mapOrNull(
          uploadImageLoading: (state) {
            _isLoading = true;
            showSuccessToast(StringsManager.loading, context);
          },
          uploadBonefracturesResult: (state) async {
            _isLoading = false;
            Fluttertoast.cancel;
            _dialog(
                title: state.data.top, desc: "${state.data.confidence * 100}");
          },
          uploadBrainTumorResult: (state) {
            _isLoading = false;
            Fluttertoast.cancel;
            log("${state.data.predictedClasses?.first}");
            _dialog(title: state.data.predictedClasses?.first);
          },
          uploadImageError: (state) {
            _isLoading = false;
            showErrorToast(state.networkExceptions.toString(), context);
          },
        );
      },
      builder: (context, state) {
        return _body(context);
      },
    );
  }

  Widget _body(context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
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
          if (_isLoading)
            Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: ColorManager.black,
                rightDotColor: ColorManager.primary,
                size: 100,
              ),
            )
        ],
      ),
    );
  }

  Color _color(double condition) {
    if (condition >= 1 && condition < 30) {
      return ColorManager.yellow;
    } else if (condition >= 30 && condition < 70) {
      return ColorManager.green;
    } else {
      return ColorManager.brightRed;
    }
  }

  AwesomeDialog _dialog({String? title, String? desc}) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        children: [
          Text(
            '$title',
            style: StyleManager.getSemiBoldStyle(
              fontSize: FontSize.s16,
              color: ColorManager.brightRed,
            ),
          ),
          if (desc != null)
            Text(
              "$desc%",
              style: StyleManager.getMediumStyle(
                fontSize: FontSize.s16,
                color: _color(double.parse(desc)),
              ),
            ),
          _brief(title),
          _moreAbout(title),
        ],
      ),
    )..show();
  }

  void _launchUrl(url) async {

    if (!await launchUrl(Uri.parse(url))) {
      showErrorToast('${StringsManager.couldNotLaunch} $url',
          navigatorKey.currentContext!);
    }
  }

  String? _briefCondition(String? title) {
    switch (title) {
      case "Comminuted fracture":
        return AppConstants.comminutedFracture;
      case "Greenstick fracture":
        return AppConstants.greenstickFracture;
      case "Fracture Dislocation":
        return AppConstants.fractureDislocation;
      case "Compression-Crush fracture":
        return null;
      case "Hairline Fracture":
        return null;
      case "Impacted fracture":
        return null;
      case "Intra-articular fracture":
        return null;
      case "Longitudinal fracture":
        return null;
      case "Spiral Fracture":
        return null;
      case "Avulsion fracture":
        return null;
      case "Oblique fracture":
        return null;
      default:
        return null;
    }
  }

  Widget _brief(String? title) {
    return TextButton(
      onPressed: () {
        _launchUrl(AppConstants.comminutedFractureUrl);
      },
      child: Text(
        _briefCondition(title) ?? '',
        style: StyleManager.getRegularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.black,
        ),
      ),
    );
  }

  Widget _moreAbout(String? title) {
    return TextButton(
      onPressed: () {
        _launchUrl(AppConstants.comminutedFractureUrl);
        switch (title) {
          case "Comminuted fracture":
            return _launchUrl(AppConstants.comminutedFractureUrl);
          case "Greenstick fracture":
            return _launchUrl(AppConstants.greenstickFractureUrl);

          case "Fracture Dislocation":
            return _launchUrl(AppConstants.fractureDislocationUrl);

          case "Compression-Crush fracture":
            return;
          case "Hairline Fracture":
            return;
          case "Impacted fracture":
            return;
          case "Intra-articular fracture":
            return;
          case "Longitudinal fracture":
            return;
          case "Spiral Fracture":
            return;
          case "Avulsion fracture":
            return;
          case "Oblique fracture":
            return;
          default:
            return;
        }
      },
      child: const Text(
        StringsManager.moreAbout,
        style: TextStyle(
          color: ColorManager.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _cameraAndGalleryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _blueBox(StringsManager.takePhoto, AssetsManager.cameraIc,
            onTap: _openCamera),
        _blueBox(
          StringsManager.fromGallery,
          AssetsManager.galleryIc,
          onTap: _openGallery,
        ),
      ],
    );
  }

  Widget _blueBox(String title, String icon, {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
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

  void _send(image) {
    switch (widget.title) {
      case StringsManager.boneFractures:
        return RouteGenerator.homeCubit.uploadOfBonefractures(image);
      case StringsManager.brainTumor:
        return RouteGenerator.homeCubit.uploadOfBrainTumor(image);
      case StringsManager.cancer:
        return;
      case StringsManager.breastCancer:
        return;
      default:
        return;
    }
  }

  Future _openGallery() async {
    final returnImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    final image = File(returnImage.path);
    _send(image);
  }

  Future _openCamera() async {
    final returnImage =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (returnImage == null) return;
    // ignore: unused_local_variable
    final image = File(returnImage.path);
  }
}
