class AppConstants {
  const AppConstants._internal();
  static const AppConstants _instance = AppConstants._internal(); // singleton
  factory AppConstants() => _instance;

  static const appName = 'Medico';

  static const domain = 'https://classify.roboflow.com/';

  // ignore: constant_identifier_names
  static const ACCESS_TOKEN_KEY = '';
  static const tokenType = '';
  static const jsonAccept = '';

  static const String onBoarding = 'on_boarding_skip';
  static const String tempImageUrl =
      'https://s3-alpha-sig.figma.com/img/ae5f/a582/40b10f833a0f090b61a0de98a9d38a06?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cL~O-OKJSgRu5RK6EqFesFOZH15iHWwqfYbnEXL~0VmDGH8c1UF5h7ye6N0BTzjsPfIU2PMqKhNmpwKpDiql5sjKLUXbKml1OceOBXyw3YsWZlnUeIqbn8Dw14UFQiwuj5sa8MtvmqIBsnRKgioOivw8P1i5PVRtgVm~jTDzZXxmjmccHT2TfCxJl4rhjPTk1yCqTzQeR2aZ3TYNslOfc9x-lZ3kMy3lFWEieDIe3eUttSkv-PvkkFe8JQRAe2BjARnA5-dCCwCClposliHT7t3kYMqw1X2cWZK6AVuObhOpoAifeqmLYta6GDjjnM-AEpReh8y5ecC1MiIMNYlIVg__';

  static const String comminutedFracture =
      'A comminuted fracture happens when you break a bone into three or more pieces.You’ll usually need surgery to repair a comminuted fracture and treat related complications. Doctors may use hardware like rods and screws to attach the pieces of bone. These stay in your bones permanently.';

  static const String comminutedFractureUrl =
      "https://www.healthline.com/health/comminuted-fracture";

  static const String greenstickFracture =
      "A greenstick fracture is a type of incomplete fracture, most common in children because their bones are softer and more flexible than adults. Here's a quick rundown:";

  static const String greenstickFractureUrl =
      "https://www.healthline.com/health/greenstick-fracture";

  static const String fractureDislocation =
      "A fracture dislocation is a serious injury where a bone is broken (fracture) and is also displaced from its normal position (dislocation). This type of injury can damage nearby nerves, blood vessels, ligaments, and tendons.";

  static const String fractureDislocationUrl =
      "https://www.healthline.com/health/dislocation";
}
