const String imagePath = 'assets/images';
const String svgPath = 'assets/svg';
const String lottiePath = 'assets/lottie';
const String tempPath = 'assets/temp';

class AssetsManager {
  const AssetsManager._internal();
  static const AssetsManager _instance = AssetsManager._internal(); // singleton
  factory AssetsManager() => _instance;

  //!temp
  static const String temp1 = '$tempPath/Ellipse 30.png';
  static const String temp2 = '$tempPath/temp2.png';
  //!OnBoarding images
  static const String onBoardingIc1 = '$svgPath/onboarding1.svg';
  static const String onBoardingIc2 = '$svgPath/onboarding2.svg';
  static const String onBoardingIc3 = '$svgPath/onboarding3.svg';

  //!bottom nav bar icons
  static const String filledHomeIc = '$svgPath/filled_home_ic.svg';
  static const String unfilledHomeIc = '$svgPath/unfilled_home_ic.svg';

  static const String unfilledSettingsIc = '$svgPath/unfilled_settings_ic.svg';
  static const String unfilledChatIc = '$svgPath/unfilled_chat_ic.svg';

  static const String robotIc = '$svgPath/robot_ic.svg';

  static const String unfilledProfileIc = '$svgPath/unfilled_profile_ic.svg';

  //!Auth
  static const String loginBackGround = '$svgPath/login.svg';
  static const String facebook = '$svgPath/facebook.svg';
  static const String google = '$svgPath/google.svg';
  static const String apple = '$svgPath/apple.svg';
  static const String forgetPassword = '$svgPath/forget_password.svg';
  static const String email = '$svgPath/email.svg';
  static const String phone = '$svgPath/phone.svg';

  //!initial settings
  static const String lang = '$svgPath/lang.svg';
  static const String location = '$svgPath/location.svg';

  //!home
  static const String searchIc = '$svgPath/search_ic.svg';
  static const String doctorPic = '$imagePath/doctor.png';

  //!chat bot
  static const String chatBot = '$imagePath/chatbot.png';
  static const String chatBubbles = '$imagePath/chatbubbles.png';
  static const String threeArrows = '$imagePath/three_arrows.png';
  static const String send = '$svgPath/send.svg';

  //!profile
  static const String setting = '$svgPath/setting.svg';

  //!common
  static const String arrowBack = '$svgPath/arrow_back.svg';
  static const String arrowForward = '$svgPath/arrow_forward.svg';
  static const String loadingShimmer = '$imagePath/loading.gif';
  static const String mySearchIc = '$svgPath/my_search_ic.svg';
  static const String unfilledFavIc = '$svgPath/unfilled_fav_ic.svg';
  static const String unfilledCartIc = '$svgPath/unfilled_cart_ic.svg';
}
