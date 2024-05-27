import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:xpert/src/features/home/data/constants/home_constants.dart';
import 'package:xpert/src/features/home/data/models/top_doctor_model.dart';
import 'package:xpert/src/features/home/presentation/widgets/specialist_container.dart';
import 'package:xpert/src/features/profile/business_logic/profile/profile_cubit.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController controller;
  List<TopDoctorsModel>? topDoctorsModelList;
  ProfileModel? model;
  @override
  void initState() {
    super.initState();
    int id = CacheHelper.getData(key: AppConstants.myId);
    log("$id");
    _getData();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(context) {
    return AppPaddingWidgetHorizontal(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            _header(CacheHelper.getData(key: AppConstants.myUserName)),
            32.verticalSpace,
            // _searchBar(),
            // 32.verticalSpace,
            _buildSpecialist(context),
            16.verticalSpace,
            _buildCategories(context),
            18.verticalSpace,
            _buildTopDoctor(context),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _circleAvatarBloc() {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.mapOrNull(
          getDoctorProfile: (state) {
            model = state.model;
          },
          getNurseProfile: (state) {
            model = state.model;
          },
          getUserProfile: (state) {
            model = state.model;
          },
          doctorProfileError: (state) {
            showErrorToast(state.error, context);
          },
          nurseProfileError: (state) {
            showErrorToast(state.error, context);
          },
          userProfileError: (state) {
            showErrorToast(state.error, context);
          },
        );
      },
      builder: (context, state) {
        if (model != null) {
          return CircleAvatar(
            radius: 26.r,
            backgroundImage:
                CachedNetworkImageProvider(model!.profileImage ?? ''),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  void _getData() {
    try {
      String type = CacheHelper.getData(key: AppConstants.myType);
      int id = CacheHelper.getData(key: AppConstants.myId);

      switch (type) {
        case AppConstants.userTypeDoctor:
          RouteGenerator.profileCubit.getDoctorProfile(id: id);
        case AppConstants.userTypeNurse:
          RouteGenerator.profileCubit.getNurseProfile(id: id);
        case AppConstants.userTypeUser:
          RouteGenerator.profileCubit.getUserProfile(id: id);
      }
    } catch (e) {
      log("$e");
    }

    RouteGenerator.homeCubit.getTopDoctors();
  }

  Widget _header(String text) {
    return Row(
      children: [
        Text(
          text,
          style: StyleManager.getMediumStyle(
            fontSize: FontSize.s16,
          ),
        ),
        const Spacer(),
        // CircleAvatar(
        //   radius: 26.r,
        //   backgroundImage: const AssetImage(AssetsManager.temp1),
        // ),
        _circleAvatarBloc(),
      ],
    );
  }

  // Widget _searchBar() {
  //   return SearchBar(
  //     controller: controller,
  //     padding:
  //         MaterialStatePropertyAll(EdgeInsetsDirectional.only(start: 14.w)),
  //     leading: const Icon(
  //       Icons.search,
  //       color: ColorManager.mediumGray,
  //     ),
  //     hintText: StringsManager.search,
  //   );
  // }

  Widget _pageView() {
    return SizedBox(
      height: 0.3.sh,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            child: SpecialistContainer(index: index),
          );
        },
      ),
    );
  }

  Widget _buildSpecialist(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context, text: StringsManager.specialist),
        8.verticalSpace,
        _pageView(),
      ],
    );
  }

  Widget _buildCategories(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context, text: StringsManager.categories),
        9.verticalSpace,
        _categories(context),
      ],
    );
  }

  Widget _buildTopDoctor(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context, text: StringsManager.topDoctors),
        9.verticalSpace,
        _topDoctorsBloc(),
      ],
    );
  }

  Widget _label(context, {required String text}) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _categories(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        categoriesList.length,
        (index) => _categoriesContainer(
          context,
          model: categoriesList[index],
        ),
      ),
    );
  }

  Widget _categoriesContainer(context, {required CategoriesModel model}) {
    return InkWell(
      onTap: model.onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 109.w,
        height: 112.h,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            model.title,
            style: StyleManager.getMediumStyle(
              color: ColorManager.white,
              fontSize: FontSize.s20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _topDoctorsBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.mapOrNull(
          getTopDoctorsSuccess: (state) {
            topDoctorsModelList = state.model;
          },
          getTopDoctorsError: (state) {
            showErrorToast(state.networkExceptions, context);
          },
        );
      },
      builder: (context, state) {
        if (topDoctorsModelList != null) {
          return _topDoctorWidget(model: topDoctorsModelList!);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _topDoctorWidget({required List<TopDoctorsModel> model}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        model.length,
        (index) => _doctorsCard(
          model: model[index],
        ),
      ),
    );
  }

  Widget _doctorsCard({required TopDoctorsModel model}) {
    return Container(
      width: 108.w,
      height: 144.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          if (model.userprofileimge != null)
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
              child: Image.network(
                fit: BoxFit.cover,
                width: 97.w,
                height: 85.h,
                model.userprofileimge ?? '',
              ),
            ),
          if (model.userprofileimge == null)
            SizedBox(
              width: 97.w,
              height: 85.h,
              child: const Center(
                child: Text("No Image"),
              ),
            ),
          Text(
            model.username ?? '',
            style: StyleManager.getRegularStyle(
              fontSize: FontSize.s18,
            ),
          ),
          Text(
            model.userSpeciality ?? '',
            style: StyleManager.getRegularStyle(
              fontSize: FontSize.s15,
              color: ColorManager.mediumGray,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
