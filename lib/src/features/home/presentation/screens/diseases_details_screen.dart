import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
import 'package:xpert/src/core/widgets/default_button.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:xpert/src/features/home/data/constants/diseases_constants.dart';
import 'package:xpert/src/features/home/presentation/widgets/drop_down_button.dart';
import 'package:xpert/src/features/home/presentation/widgets/model_text_filed.dart';

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
  bool gpu = false;
  ResolutionPreset resolution = ResolutionPreset.high;

  // String labels = AssetsManager.aiTestLabel;
  // String model = AssetsManager.aiBoneFractureModel;

  late TextEditingController? _numThreadsController;
  late TextEditingController? _classThresholdController;
  late TextEditingController? _confThresholdController;
  late TextEditingController? _iouThresholdController;

  @override
  void initState() {
    super.initState();
    listOfContent = listType(widget.title);
    _imagePicker = ImagePicker();
    _numThreadsController = TextEditingController(text: "1");
    _classThresholdController = TextEditingController(text: "0.5");
    _confThresholdController = TextEditingController(text: "0.4");
    _iouThresholdController = TextEditingController(text: "0.4");
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
            _dialog(title: state.data.predictedClasses?.first);
          },
          uploadBreastCancerResult: (state) {
            _isLoading = false;
            Fluttertoast.cancel;
            _dialog(title: state.data.predictedClasses?.first);
          },
          uploadImageError: (state) {
            Fluttertoast.cancel;
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
                    _details(),
                    ..._generateDetails(),
                  ],
                ),
              ),
            ],
          ),
          if (_isLoading) _twistingDots(),
        ],
      ),
    );
  }

  Widget _details() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Text(
        StringsManager.details,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  List _generateDetails() {
    return List.generate(
      listOfContent.length,
      (index) => _bodyText(context, title: listOfContent[index].body),
    );
  }

  Widget _twistingDots() {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: ColorManager.black,
        rightDotColor: ColorManager.primary,
        size: 100,
      ),
    );
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
                color: color(double.parse(desc)),
              ),
            ),
          _brief(title),
          _moreAbout(title),
        ],
      ),
    )..show();
  }

  Widget _brief(String? title) {
    return Text(
      briefCondition(title) ?? '',
      style: StyleManager.getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.black,
      ),
    );
  }

  Widget _moreAbout(String? title) {
    return TextButton(
      onPressed: () {
        launchUrlCondition(title);
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
        _blueBox(
          StringsManager.openCamera,
          AssetsManager.cameraIc,
          onTap: () {
            _dialogQuestion();
          },
        ),
        _blueBox(
          StringsManager.fromGallery,
          AssetsManager.galleryIc,
          onTap: _openGallery,
        ),
      ],
    );
  }

  AwesomeDialog _dialogQuestion() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        children: [
          ModelTextFiled(
            title: "Num threads",
            hint: "Enter int num",
            controller: _numThreadsController,
            onChanged: (value) {},
          ),
          15.verticalSpace,
          ModelTextFiled(
            title: "Class thresholds",
            hint: "Enter double num",
            controller: _classThresholdController,
            onChanged: (value) {},
          ),
          15.verticalSpace,
          ModelTextFiled(
            title: "Conf threshold",
            hint: "Enter double num",
            controller: _confThresholdController,
            onChanged: (value) {},
          ),
          15.verticalSpace,
          ModelTextFiled(
            title: "Iou threshold",
            hint: "Enter double num",
            controller: _iouThresholdController,
            onChanged: (value) {},
          ),
          15.verticalSpace,
          ModelDropDownButton(
            title: StringsManager.chosesCameraResolution,
            onChanged: (value) {
              if (value == AppConstants.resolutionMedium) {
                setState(() {
                  resolution = ResolutionPreset.medium;
                });
              } else if (value == AppConstants.resolutionHigh) {
                setState(() {
                  resolution = ResolutionPreset.high;
                });
              } else {
                setState(() {
                  resolution = ResolutionPreset.low;
                });
              }
            },
          ),
          ModelDropDownButton(
            title: StringsManager.gpuOption,
            onChanged: (value) {
              if (value == "true") {
                setState(() {
                  gpu = true;
                });
              } else {
                setState(() {
                  gpu = false;
                });
              }
            },
          ),
          DefaultButton(
            width: 150.w,
            height: 50.h,
            onPressed: () async {
              await _navigatorPop();
              Navigator.pushNamed(
                navigatorKey.currentContext!,
                Routes.yoloScreen,
                arguments: {
                  "gpu": gpu,
                  "labels": label(widget.title),
                  "modelPath": model(widget.title),
                  "resolutionPreset": resolution,
                  "numThreads": int.parse(_numThreadsController?.text ?? "1"),
                  "classThreshold":
                      double.parse(_classThresholdController?.text ?? "0.5"),
                  "confThreshold":
                      double.parse(_confThresholdController?.text ?? "0.4"),
                  "iouThreshold":
                      double.parse(_iouThresholdController?.text ?? " 0.4"),
                },
              );
            },
            title: StringsManager.continueWord,
          ),
        ],
      ),
    )..show();
  }

  _navigatorPop() {
    Navigator.of(context).pop();
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

  Future _openGallery() async {
    final returnImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    final image = File(returnImage.path);
    sendImage(widget.title, image);
  }
}
