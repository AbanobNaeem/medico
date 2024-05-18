import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';
import 'package:xpert/src/features/home/data/constants/doctors_list_constants.dart';
import 'package:xpert/src/features/home/data/models/get_doctor.dart';
import 'package:xpert/src/features/home/presentation/widgets/drop_down_menu.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  GetDoctorOrNurse? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: _appBar(context),
      body: _bodyBloc(),
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
      title: const Text(StringsManager.doctorsList),
      actions: const [DropDownMenuWidget()],
    );
  }

  Widget _bodyBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.mapOrNull(
          getDoctorSuccess: (state) {
            data = state.data;
          },
        );
      },
      builder: (context, state) {
        if (state == const HomeState.getDoctorLoading()) {
          return _twistingDots();
        } else if (data != null) {
          return _body(data!);
        } else {
          return _warningsHint();
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

  Widget _warningsHint() {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        StringsManager.pleaseSpecialtyGovernorate,
        style: StyleManager.getMediumStyle(
          fontSize: FontSize.s20,
        ),
      ),
    );
  }

  Widget _body(GetDoctorOrNurse data) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 0.23.sh,
      ),
      itemCount: data.doctorOrNurse?.length ?? 0,
      itemBuilder: (context, index) => _containerBody(
        image: data.doctorOrNurse?[index].profileImage ?? '',
        drName: data.doctorOrNurse?[index].username ?? '',
        drSpecialty: data.doctorOrNurse?[index].speciality ?? '',
      ),
    );
  }

  Widget _containerBody({
    required String image,
    required String drName,
    required String drSpecialty,
  }) {
    return _containerDecoration(
      child: Column(
        children: [
          8.verticalSpace,
          CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage(image),
          ),
          4.verticalSpace,
          Text(
            drName,
            style: StyleManager.getRegularStyle(fontSize: FontSize.s16),
          ),
          Text(
            drSpecialty,
            style: StyleManager.getRegularStyle(fontSize: FontSize.s16),
          ),
          9.verticalSpace,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.appointmentScreen,
                  arguments: {
                    "model": DoctorsListModel(
                      image: image,
                      drName: drName,
                      drSpecialty: drSpecialty,
                    )
                  });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(132.w, 38.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
              elevation: 0,
              foregroundColor: ColorManager.black,
              backgroundColor: ColorManager.offWhite,
            ),
            child: Text(StringsManager.appointment,
                style: StyleManager.getSemiBoldStyle(
                  fontSize: FontSize.s14,
                )),
          ),
        ],
      ),
    );
  }

  Widget _containerDecoration({Widget? child}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
