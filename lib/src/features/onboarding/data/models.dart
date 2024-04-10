//! onboarding models
class OnboardingModel {
  String title;
  String description;
  String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

// the model who hold data from viewmodel to view
class OnboardingViewObject {
  OnboardingModel onboardingModel;
  int numOfScreens;
  int currentIndex;

  OnboardingViewObject(
      this.onboardingModel, this.numOfScreens, this.currentIndex);
}
