import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/features/chat/business_logic/doctor_chat/doctor_chat_cubit.dart';
import 'package:xpert/src/features/chat/data/models/messages_model.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<MessagesModel>? lisOfModels;
  @override
  void initState() {
    super.initState();
    final int id = CacheHelper.getData(key: AppConstants.myId);
    RouteGenerator.doctorChatCubit.getMessages(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _bodyBloc(),
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: const Text(StringsManager.message),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: SvgPicture.asset(
            width: 17.w,
            height: 17.h,
            AssetsManager.searchIc,
            colorFilter: const ColorFilter.mode(
              ColorManager.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bodyBloc() {
    return BlocConsumer<DoctorChatCubit, DoctorChatState>(
      listener: (context, state) {
        state.mapOrNull(
          gerMessagesLoaded: (state) {
            lisOfModels = state.list;
          },
          gerMessagesError: (state) {
            showErrorToast(state.error, context);
          },
        );
      },
      builder: (context, state) {
        if (state == const DoctorChatState.getMessagesLoading()) {
          return _twistingDots();
        } else if (lisOfModels != null) {
          return _body(list: lisOfModels!);
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

  Widget _body({required List<MessagesModel> list}) {
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: kBottomNavigationBarHeight.h,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) => _listTile(
        model: list[index],
      ),
    );
  }

  Widget _listTile({required MessagesModel model}) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          Routes.doctorChat,
          arguments: {
            "model": model,
          },
        );
      },
      shape: const Border(
          bottom: BorderSide(
        color: ColorManager.mediumGray,
      )),
      horizontalTitleGap: 10.w,
      leading: Container(
        width: 68.w,
        height: 68.w,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(model.profileImage ?? ''),
        )),
      ),
      title: Text(model.username ?? ''),
      titleTextStyle: StyleManager.getMediumStyle(fontSize: FontSize.s18),
      subtitle: Text(model.lastMessage?.content ?? ''),
      subtitleTextStyle: StyleManager.getLightStyle(
          fontSize: FontSize.s16, color: ColorManager.mediumGray),
      trailing: Text(
        convertTimestampFormat(model.lastMessage?.timestamp ?? ''),
        style: StyleManager.getSemiBoldStyle(
          fontSize: FontSize.s15,
          color: ColorManager.mediumGray,
        ),
      ),
    );
  }
}
