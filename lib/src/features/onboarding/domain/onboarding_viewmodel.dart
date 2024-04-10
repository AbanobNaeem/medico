import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/features/base_view_model/base_viewmodel.dart';
import 'package:xpert/src/features/onboarding/data/models.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnboardingViewModelInputs,
        OnboardingModelOutputs {
  OnBoardingViewModel._internal();
  static final OnBoardingViewModel _instance =
      OnBoardingViewModel._internal(); // singleton
  factory OnBoardingViewModel() => _instance;

  // stream controllers
  late final StreamController<OnboardingViewObject> _streamController;

  late final List<OnboardingModel> _list;

  late final int _listLength;

  int _currentIndex = 0;

  late PageController onBoardingPageController;

  @override
  void init() {
    onBoardingPageController = PageController();

    _streamController = StreamController<OnboardingViewObject>();

    _list = _onBoardingData;
    _listLength = _list.length;

    // send this onboarding data to our view
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
    onBoardingPageController.dispose();
  }

  @override
  Future<void> goNext(OnboardingViewObject? onboardingViewObject,
      {required Duration duration, required Curve curve}) async {
    if (_currentIndex != _listLength - 1) {
      await onBoardingPageController.animateToPage(++_currentIndex,
          duration: duration, curve: curve);
    } else {
      await CacheHelper.saveData(key: AppConstants.onBoarding, value: true)
          .then(
        (value) {
          Navigator.pushReplacementNamed(
              navigatorKey.currentContext!, Routes.authTapBar);
        },
      );
    }
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputOnBoardingViewModel => _streamController.sink;

  @override
  Stream<OnboardingViewObject> get outputSliderViewObject =>
      _streamController.stream
          .map((onboardingViewObject) => onboardingViewObject);

  //! onBoarding private functions
  final List<OnboardingModel> _onBoardingData = [
    OnboardingModel(
      title: StringsManager.onBoardingIcTitle1,
      description: StringsManager.onBoardingIcDesc1,
      image: AssetsManager.onBoardingIc1,
    ),
    OnboardingModel(
      title: StringsManager.onBoardingIcTitle2,
      description: StringsManager.onBoardingIcDesc2,
      image: AssetsManager.onBoardingIc2,
    ),
    OnboardingModel(
      title: StringsManager.onBoardingIcTitle3,
      description: StringsManager.onBoardingIcDesc3,
      image: AssetsManager.onBoardingIc3,
    ),
  ];

  void _postDataToView() {
    final onboardingViewObject =
        OnboardingViewObject(_list[_currentIndex], _listLength, _currentIndex);
    inputOnBoardingViewModel.add(onboardingViewObject);
  }

  @override
  Future<void> onSkip() async {
    await CacheHelper.saveData(key: AppConstants.onBoarding, value: true).then(
      (value) {
        Navigator.pushReplacementNamed(
            navigatorKey.currentContext!, Routes.authTapBar);
      },
    );
  }
}

// inputs mean the orders that our view model will receive from our view
abstract class OnboardingViewModelInputs {
  Future<void> goNext(OnboardingViewObject? onboardingViewObject,
      {required Duration duration,
      required Curve curve}); // when user clicks on right arrow or swipe left.

  Future<void> onSkip();
  void onPageChanged(int index);

  // this is the way to add data to the stream .. stream input
  Sink get inputOnBoardingViewModel;
}

// outputs mean data or results that will be sent from our view model to our view
abstract class OnboardingModelOutputs {
  Stream<OnboardingViewObject> get outputSliderViewObject;
}
