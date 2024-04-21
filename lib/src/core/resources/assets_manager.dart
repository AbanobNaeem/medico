const String imagePath = 'assets/images';
const String svgPath = 'assets/svg';
const String lottiePath = 'assets/lottie';
const String tempPath = 'assets/temp';

class AssetsManager {
  const AssetsManager._internal();
  static const AssetsManager _instance = AssetsManager._internal(); // singleton
  factory AssetsManager() => _instance;

  //!temp
  static const String temp1 = '$tempPath/Ellipse 9.png';
  static const String temp2 = '$tempPath/temp2.png';
  static const String temp3 = '$tempPath/Ellipse 34.png';
  static const String temp4 = '$tempPath/Ellipse 35.png';
  static const String temp5 = '$tempPath/Rectangle 92.png';
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

  //!home
  static const String searchIc = '$svgPath/search_ic.svg';
  static const String doctorPic = '$imagePath/doctor.png';

  static const String bonefracturesPic = '$imagePath/bonefractures.png';
  static const String braintumorPic = '$imagePath/braintumor.png';
  static const String breastcancerPic = '$imagePath/breastcancer.png';
  static const String cancerPic = '$imagePath/cancer.png';

  //!chat bot
  static const String chatBot = '$imagePath/chatbot.png';
  static const String chatBubbles = '$imagePath/chatbubbles.png';
  static const String threeArrows = '$imagePath/three_arrows.png';
  static const String send = '$svgPath/send.svg';

  //!profile
  static const String setting = '$svgPath/setting.svg';

  //!settings
  static const String lang = '$svgPath/lang.svg';
  static const String location = '$svgPath/location.svg';
  static const String notificationsIc = '$svgPath/notifications_ic.svg';
  static const String keyIc = '$svgPath/key_ic.svg';
  static const String editProfileIc = '$svgPath/edit_profile_ic.svg';
  static const String unfilledFacebookIc = '$svgPath/unfilled_facebook_ic.svg';

  //!common
  static const String arrowBack = '$svgPath/arrow_back.svg';
  static const String arrowForward = '$svgPath/arrow_forward.svg';
  static const String loadingShimmer = '$imagePath/loading.gif';
  static const String mySearchIc = '$svgPath/my_search_ic.svg';
  static const String unfilledFavIc = '$svgPath/unfilled_fav_ic.svg';
  static const String unfilledCartIc = '$svgPath/unfilled_cart_ic.svg';
  static const String cameraIc = '$svgPath/camera_ic.svg';
  static const String galleryIc = '$svgPath/gallery_ic.svg';
  static const String documentIc = '$svgPath/document.svg';
  static const String emojiIc = '$svgPath/emoji.svg';
  static const String star = '$svgPath/star.svg';
  static const String yellowStar = '$svgPath/yellow_star.svg';
  static const String experience = '$svgPath/experience.svg';
  static const String people = '$svgPath/people.svg';
}
