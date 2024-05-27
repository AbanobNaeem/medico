import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/features/chat/data/models/messages_model.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:xpert/src/features/home/data/models/get_nurse_or_doctor_info.dart';
import 'package:xpert/src/features/home/presentation/widgets/gradient_button.dart';
import 'package:readmore/readmore.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({
    super.key,
    required this.id,
    required this.type,
  });
  final int id;
  final String type;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  GetNurseOrDoctorInfo? data;
  @override
  void initState() {
    super.initState();

    switch (widget.type) {
      case AppConstants.userTypeDoctor:
        RouteGenerator.homeCubit.getDoctorInfo(doctorId: widget.id);
      case AppConstants.userTypeNurse:
        RouteGenerator.homeCubit.getNurseInfo(nurseId: widget.id);
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: _appBar(context),
      body: _bodyBloc(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        iconSize: 20.h,
        color: ColorManager.black,
      ),
    );
  }

  Widget _bodyBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.mapOrNull(
          getDoctorInfoSuccess: (state) {
            data = state.data;
          },
          getNurseInfoSuccess: (state) {
            data = state.data;
          },
          getNurseInfoError: (state) {
            showErrorToast(state.networkExceptions, context);
          },
          getDoctorInfoError: (state) {
            showErrorToast(state.networkExceptions, context);
          },
        );
      },
      builder: (context, state) {
        if (state == const HomeState.getNurseInfoLoading() ||
            state == const HomeState.getDoctorInfoLoading()) {
          return _twistingDots();
        } else if (data != null) {
          return _body(data!);
        } else {
          return const SizedBox();
        }
      },
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

  Widget _body(GetNurseOrDoctorInfo model) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          _customListTile(model),
          16.verticalSpace,
          _containerContent(model),
          24.verticalSpace,
          AppPaddingWidgetHorizontal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _label(StringsManager.aboutDoctors),
                8.verticalSpace,
                _readMoreText(model),
                if (widget.type == AppConstants.userTypeDoctor ||
                    widget.type == AppConstants.userTypeNurse)
                  24.verticalSpace,
                if (widget.type == AppConstants.userTypeDoctor ||
                    widget.type == AppConstants.userTypeNurse)
                  _label(StringsManager.workingTime),
                if (widget.type == AppConstants.userTypeDoctor ||
                    widget.type == AppConstants.userTypeNurse)
                  8.verticalSpace,
                if (widget.type == AppConstants.userTypeDoctor ||
                    widget.type == AppConstants.userTypeNurse)
                  _bodyText(model.workTime ?? ''),
                24.verticalSpace,
                if (model.address != null) _label(StringsManager.address),
                if (model.address != null) 8.verticalSpace,
                if (model.address != null) _bodyText(model.address!),
                if (model.address != null) 24.verticalSpace,
                if (model.phoneNumber != null)
                  _label(StringsManager.phoneNumber),
                if (model.address != null) 8.verticalSpace,
                _bodyText(model.phoneNumber ?? ''),
                24.verticalSpace,
                if (model.pricePerHour != null)
                  _label(StringsManager.pricePerHour),
                if (model.pricePerHour != null) 8.verticalSpace,
                if (model.pricePerHour != null)
                  _bodyText(model.pricePerHour ?? ''),
                // _label(StringsManager.schedule),
                // 16.verticalSpace,
                // const TableCalendarWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customListTile(GetNurseOrDoctorInfo model) {
    return AppPaddingWidgetHorizontal(
      child: Row(
        children: [
          Container(
            width: 90.h,
            height: 90.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(model.profileImage ?? ''),
              ),
              shape: BoxShape.circle,
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.username ?? '',
                style: StyleManager.getMediumStyle(fontSize: FontSize.s18),
              ),
              Row(
                children: [
                  SvgPicture.asset(AssetsManager.star),
                  5.horizontalSpace,
                  Text(
                    "${model.governorates}",
                    style: StyleManager.getRegularStyle(
                        fontSize: FontSize.s16, color: ColorManager.mediumGray),
                  ),
                ],
              ),
              Text(
                "${model.speciality}",
                style: StyleManager.getRegularStyle(
                    fontSize: FontSize.s16, color: ColorManager.mediumGray),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _readMoreText(GetNurseOrDoctorInfo model) {
    return ReadMoreText(
      style: StyleManager.getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.mediumGray,
      ),
      model.description ?? '',
      trimMode: TrimMode.Line,
      trimLines: 3,
      trimCollapsedText: StringsManager.seeMore,
      trimExpandedText: StringsManager.seeLess,
      lessStyle: StyleManager.getSemiBoldStyle(
        fontSize: FontSize.s16,
        color: ColorManager.brightRed,
      ),
      moreStyle: StyleManager.getSemiBoldStyle(
        fontSize: FontSize.s16,
        color: ColorManager.primary,
      ),
    );
  }

  Widget _container({Widget? child}) {
    return Container(
      width: 112.w,
      height: 114.h,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _containerContent(GetNurseOrDoctorInfo model) {
    return Center(
      child: InkWell(
        onTap: () {
          _rating();
        },
        child: _container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.yellowStar),
              10.verticalSpace,
              Column(
                children: [
                  Text(
                    "${model.mostFrequentRating ?? 0}",
                    style: StyleManager.getMediumStyle(fontSize: FontSize.s20),
                  ),
                  Text(
                    StringsManager.rating,
                    style: StyleManager.getRegularStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.mediumGray,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AwesomeDialog _rating() {
    return AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      customHeader: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          size: 50,
          Icons.star_rounded,
          color: Colors.amber,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: RatingBar.builder(
        initialRating: 0,
        minRating: 0,
        direction: Axis.horizontal,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 10.h),
        itemBuilder: (context, _) => const Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          int id = CacheHelper.getData(key: AppConstants.myId);
          RouteGenerator.homeCubit.addRating(
            userId: id,
            doctorOrnursId: widget.id,
            ratingValue: rating.round(),
          );
          Navigator.of(context).pop();
        },
      ),
    )..show();
  }

  Widget _label(String text) {
    return Text(
      text,
      style: StyleManager.getMediumStyle(fontSize: FontSize.s18),
    );
  }

  Widget _bodyText(String text) {
    return Text(
      text,
      style: StyleManager.getRegularStyle(
          fontSize: FontSize.s16, color: ColorManager.mediumGray),
    );
  }

  Widget _bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.r),
          onTap: () {
            Navigator.pushNamed(context, Routes.doctorChat, arguments: {
              "model": MessagesModel(
                userId: widget.id,
                username: data?.username,
                profileImage: data?.profileImage,
              ),
            });
          },
          child: GradientButton(
            height: 72.h,
            title: StringsManager.appointment,
            textStyle: StyleManager.getMediumStyle(
                fontSize: FontSize.s20, color: ColorManager.white),
          ),
        ),
      ),
    );
  }
}
