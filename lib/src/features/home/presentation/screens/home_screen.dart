import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/features/home/constants/home_constants.dart';
import 'package:xpert/src/features/home/presentation/widgets/specialist_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
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
            _header("Hi Tasnim !"),
            32.verticalSpace,
            _searchBar(),
            32.verticalSpace,
            _buildSpecialist(context),
            16.verticalSpace,
            _buildCategories(context),
            18.verticalSpace,
            _buildTopDoctor(context),
          ],
        ),
      ),
    );
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
        CircleAvatar(
          radius: 26.r,
          backgroundImage: const AssetImage(AssetsManager.temp1),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return SearchBar(
      controller: controller,
      padding:
          MaterialStatePropertyAll(EdgeInsetsDirectional.only(start: 14.w)),
      leading: const Icon(
        Icons.search,
        color: ColorManager.mediumGray,
      ),
      hintText: StringsManager.search,
    );
  }

  Widget _buildSpecialist(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context, text: StringsManager.specialist),
        8.verticalSpace,
        const SpecialistContainer(),
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
        _topDoctor(),
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
          color: ColorManager.royalBlue,
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

  Widget _topDoctor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        topDoctorsList.length,
        (index) => _doctorsCard(
          model: topDoctorsList[index],
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
          Image.asset(AssetsManager.temp2),
          Text(
            model.title,
            style: StyleManager.getRegularStyle(
              fontSize: FontSize.s18,
            ),
          ),
          Text(
            model.subtitle,
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
