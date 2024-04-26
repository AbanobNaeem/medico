class AppConstants {
  const AppConstants._internal();
  static const AppConstants _instance = AppConstants._internal(); // singleton
  factory AppConstants() => _instance;

  static const appName = 'Xpert';

  static const String onBoarding = 'on_boarding_skip';
  static const String tempImageUrl = 'https://s3-alpha-sig.figma.com/img/ae5f/a582/40b10f833a0f090b61a0de98a9d38a06?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cL~O-OKJSgRu5RK6EqFesFOZH15iHWwqfYbnEXL~0VmDGH8c1UF5h7ye6N0BTzjsPfIU2PMqKhNmpwKpDiql5sjKLUXbKml1OceOBXyw3YsWZlnUeIqbn8Dw14UFQiwuj5sa8MtvmqIBsnRKgioOivw8P1i5PVRtgVm~jTDzZXxmjmccHT2TfCxJl4rhjPTk1yCqTzQeR2aZ3TYNslOfc9x-lZ3kMy3lFWEieDIe3eUttSkv-PvkkFe8JQRAe2BjARnA5-dCCwCClposliHT7t3kYMqw1X2cWZK6AVuObhOpoAifeqmLYta6GDjjnM-AEpReh8y5ecC1MiIMNYlIVg__';
}
