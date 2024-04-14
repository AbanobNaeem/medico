class StringsManager {
  const StringsManager._internal();
  static const StringsManager _instance =
      StringsManager._internal(); // singleton
  factory StringsManager() => _instance;

  static const String noRoute = 'No Route';

  //!onBoarding

  static const String continueWord = 'continue';
  static const String getStart = 'Get Start';
  static const String skip = 'skip';
  static const String start = 'start';

  static const String onBoardingIcTitle1 = "CHATBOT";
  static const String onBoardingIcDesc1 =
      "The application has a chatbot that you can ask about anything you want to know";

  static const String onBoardingIcTitle2 = "X-Ray";
  static const String onBoardingIcDesc2 =
      " application you can know the results of your X-ray through its image";

  static const String onBoardingIcTitle3 = "Doctors";
  static const String onBoardingIcDesc3 =
      "In application you can consult specialized doctors";

  //!log in
  static const String login = 'LOGIN';
  static const String signUp = 'SIGN UP';
  static const String socialMediaAuth = 'Or sign up with';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String fullName = 'Full Name';
  static const String phoneNumber = 'Phone Number';

  //!ForgetPassword
  static const String forgetPassword = 'Forget Password ?';
  static const String forgetPasswordDesc =
      'Select Which Contact Details Should\nWe Use To Reset Your Password?';
  static const String resetViaEmail = 'Reset Via Email ';
  static const String getPasswordCode = 'get password code via';
  static const String resetViaSmg = 'Reset via smg';

  //!ResetPassword
  static const String createNewPassword = 'Create New Password';
  static const String resetPasswordDesc =
      'Your New Password Must Be Different\nFrom Previously Used Password';
  static const String confirmPassword = 'confirm password';
  static const String resetPassword = 'RESET PASSWORD';

  //!OTP
  static const String enter4Digits = 'Enter 4-digit recovery code';
  static const String oTPDesc =
      'The recovery code was sent your email\nplease enter the code';
  static const String reSendCode = 'Re-send code in ';
  static const String verify = 'VERIFY';
  static const String doNotReceiveCode = 'I don\'t receive code';

  //!home
  static const String specialist = "Specialist";
  static const String categories = "Categories";
  static const String topDoctors = "Top Doctors";

  static const String specialistDesc1 =
      "looking For Your Desire Specialist Doctor?";
  static const String specialistDrName1 = "Dr. Ahmed Mohamed";
  static const String specialist1 = "Orthopedist";

  static const String category1 = "Diseases";
  static const String category2 = "Doctors";
  static const String category3 = "Health \ncare";

  static const String topDoctorsTitle1 = "Dr. Alaa";
  static const String topDoctorsTitle2 = "Dr. Alaa";
  static const String topDoctorsTitle3 = "Dr. Alaa";

  static const String topDoctorsSubTitle1 = "Orthopedist";
  static const String topDoctorsSubTitle2 = "Orthopedist";
  static const String topDoctorsSubTitle3 = "Orthopedist";

  //!chat bot
  static const String meetThe = "Meet the";
  static const String chatbot = "Chatbot!";
  static const String needOurHelpNow = "Need  Our Help\n now?";
  static const String massage = "Massage...";

  //!profile
  static const String profile = "Profile";
  static const String yourEmail = 'your email';
  static const String yourPassword = 'your password';
  static const String city = 'city';
  static const String yourPhone = 'your phone';
  static const String country = 'country';

  //!setting
  static const String setting = 'Setting';
  static const String editProfile = 'Edit Profile';
  static const String notifications = 'Notifications';
  static const String language = 'Language';
  static const String editEmail = 'Edit email';
  static const String facebook = 'Facebook';
  static const String logout = 'Logout';
 


  //!common
  static const String send = 'SEND';
  static const String getStarted = 'Get Started';
  static const String english = 'English';
  static const String arabic = 'العربية';
  static const String search = 'search';
}
