
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/features/onboarding/data/models.dart';
import 'package:xpert/src/features/onboarding/domain/onboarding_viewmodel.dart';
import 'package:xpert/src/features/onboarding/presentation/widgets/on_boarding_data_widget.dart';
import 'package:xpert/src/features/onboarding/presentation/widgets/onboarding_buttons_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _viewModel = OnBoardingViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnboardingViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) => _buildBody(snapshot.data));
  }

  Widget _buildBody(OnboardingViewObject? onboardingViewObject) {
    if (onboardingViewObject == null) {
      return const SizedBox();
    } else {
      return Scaffold(
        body: Column(
          children: [
            //! onBoarding PageView
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _viewModel.onBoardingPageController,
                onPageChanged: (index) {
                  _viewModel.onPageChanged(index);
                },
                itemCount: onboardingViewObject.numOfScreens,
                itemBuilder: (context, index) {
                  final onBoardingDataWidget = OnBoardingDataWidget(
                      onboardingViewObject: onboardingViewObject);
                  return onBoardingDataWidget;
                },
              ),
            ),
            //! onBoarding Buttons
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OnboardingButtonsWidget(
                    onNextTap: () async {
                      await _viewModel.goNext(
                        onboardingViewObject,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    onSkipTap: () async {
                      await _viewModel.onSkip();
                    },
                    onboardingViewObject: onboardingViewObject,
                  ),
                  kBottomNavigationBarHeight.verticalSpace
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
