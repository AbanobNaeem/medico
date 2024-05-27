class StringsManager {
  const StringsManager._internal();
  static const StringsManager _instance =
      StringsManager._internal(); // singleton
  factory StringsManager() => _instance;

  static const String noRoute = 'No Route';

  //!onBoarding

  static const String continueWord = 'continue';
  static const String edit = 'edit';
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
  static const String anErrorOccurred = 'An Error Occurred';
  static const String password = 'Password';
  static const String fullName = 'Full Name';
  static const String phoneNumber = 'Phone Number';
  static const String pricePerHour = "Price per hour";

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

  static const String boneFractures = "Bone fractures";
  static const String brainTumor = "Brain tumor";
  static const String cancer = "Cancer";
  static const String breastCancer = "Breast cancer";

  static const String specialistDesc1 =
      "looking For Your Desire Specialist Doctor?";
  static const String specialistDrName1 = "Dr. Ahmed Mohamed";
  static const String specialist1 = "Orthopedist";

  static const String diseases = "Diseases";
  static const String doctors = "Doctors";
  static const String healthCare = "Health \ncare";

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

  //!Bone fractures
  static const String boneFracturesBodyText1 =
      'A fracture is a break or a crack in a bone.';
  static const String boneFracturesBodyText2 =
      'A fracture occurs when force exerted a bone is stronger than the bone can structurally withstand.';
  static const String boneFracturesBodyText3 =
      'The most common sites for bone fractures are the wrist, ankle and hip.';
  static const String boneFracturesBodyText4 =
      'Treatment includes immobilizing the bone with a plaster cast, or surgically inserting metal rods or plates to hold \nthe bone .';
  static const String boneFracturesBodyText5 =
      'In most cases, your cast will be remove after a few weeks, but you must treat your limb with care for at least \nthe next month .';
  static const String boneFracturesBodyText6 =
      'Some complicated fractures may need surgery and surgical traction.';

  //!Brain tumor
  static const String brainTumorBodyText1 =
      "A brain tumor is a growth of cells \nin the brain or near it. Brain \ntumors can happen in the brain \ntissue. Brain tumors also can \nhappen near the brain tissue. \nNearby locations include nerves, \nthe pituitary gland, the pineal \ngland, and the membranes that \ncover the surface of the brain.";
  static const String brainTumorBodyText2 =
      "Brain tumors can begin in the brain. \nThese are called primary brain tumors.\nSometimes, cancer spreads to \nthe brain from other parts of the body. \nThese tumors are secondary brain \ntumors, also called metastatic brain \ntumors.";

  static const String brainTumorBodyText3 =
      "Brain tumor treatment options depend \non the type of brain tumor you have, \nas well as its size and location.\nCommon treatments include \nsurgery and radiation therapy.";

//! Cancer
  static const String cancerBodyText1 =
      'Cancer is a disease in which \nsome of the body\'s cells grow \nuncontrollably and spread to \nother parts of the body.';
  static const String cancerBodyText2 =
      'Cancer can start almost anywhere in \nthe human body, which is made up of \ntrillions of cells. Normally, human cells \ngrow and multiply (through a process \ncalled cell division) to form new cells \nas the body needs them. When cells \ngrow old or become damaged, they \ndie, and new cells take their place.';
  static const String cancerBodyText3 =
      'Sometimes this orderly process breaks \ndown, and abnormal or damaged \ncells grow and multiply when they \nshouldn\'t. These cells may \nform tumors, which are lumps of tissue.\nTumors can be cancerous or not \ncancerous (benign).';
  static const String cancerBodyText4 =
      'Cancerous tumors spread into,\nor invade, nearby tissues and can \ntravel to distant places in the body \nto form new tumors\n(a process called metastasis).';
  static const String cancerBodyText5 =
      'Benign tumors do not spread into,\nor invade, nearby tissues.\nWhen removed, benign tumors \nusually don\'t grow back, whereas \ncancerous tumors sometimes do.\nBenign tumors can sometimes be \nquite large, however. Some can \ncause serious symptoms or be life \nthreatening, such as benign tumors \nin the brain.';
  //! Breast cancer
  static const String breastCancerBodyText1 =
      'Breast cancer starts in the \nbreast tissue when mutated cells \ngrow out of control, eventually \ncreating a mass, or tumor.';
  static const String breastCancerBodyText2 =
      'This information is provided by \nBreastcancer.org.\nDonate to support free resources \nand programming for people \naffected by breast cancer.';
  static const String breastCancerBodyText3 =
      'Cells in our bodies have a normal cell \ncycle: They grow and divide, making \ncopies of themselves as needed to \nreplace old or abnormal cells. And just \nas they receive signals to grow, \nthey receive signals to die off when \ndamaged.';
  static const String breastCancerBodyText4 =
      'Breast cancer is always caused by \na mistake in genetic \nmaterial (called a genetic abnormality).\nStill, only 5% to 10% of cancers are \nlinked to genetic abnormalities';

  static const String moreAbout = "More About";

  static const String couldNotLaunch = "Could not launch";

  //! Doctors List
  static const String doctorsList = 'Doctors List';
  static const String nurseList = 'Nurse List';
  static const String drAillaAhmed = 'Dr. Ailla Ahmed';
  static const String drAhmed = 'Dr.  Ahmed ';
  static const String orthopedist = 'Orthopedist';
  static const String appointment = 'Appointment';

  static const String governorate = 'Governorate';
  static const String specialty = 'Specialty';
  static const String pleaseSpecialtyGovernorate =
      'Please enter\n governorate & speciality\nto search';
  static const String pleaseGovernorate = 'Please enter governorate\nto search';

  static const String pleaseEnterGovernorate = "Please Enter Governorate";
  static const String pleaseEnterSpeciality = "Enter Speciality";

  //! Health Care
  static const String healthCareTitle = 'Health Care';
  static const String schedule = 'Schedule';
  static const String workingTime = 'Working time';
  static const String aboutDoctors = 'About Doctors';
  static const String oldPassword = 'Old Password';
  static const String newPassword = 'New Password';
  static const String people = 'people';
  static const String experience = 'Experience';
  static const String rating = 'Rating';
  static const String address = 'Address';

  static const String resolution = 'Resolution';
  static const String gpu = 'GPU';
  static const String chosesCameraResolution = 'Choses camera\nresolution:';

  static const String gpuOption = 'GPU option:';

  //!common
  static const String send = 'SEND';
  static const String getStarted = 'Get Started';
  static const String english = 'English';
  static const String arabic = 'العربية';
  static const String search = 'search';
  static const String details = 'Details';
  static const String takePhoto = 'Take photo';
  static const String openCamera = 'Open Camera';
  static const String fromGallery = 'From Gallery';
  static const String message = 'Message';
  static const String online = 'Online';
  static const String reviews = 'reviews';
  static const String seeMore = 'See more';
  static const String seeLess = 'See less';
  static const String loading = 'Loading';

  static const String speciality = 'Speciality';
  static const String governorates = 'Governorates';
  static const String priceperhour = 'Price per hour';
}
