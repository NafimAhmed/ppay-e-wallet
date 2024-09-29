//App Title

import 'package:get/get.dart';

const kAppTitle = 'P Pay';

// Images
const kAppLogo = 'assets/images/app_logo.png';
const kStartScreenLogo = 'assets/images/start_screen_logo.svg';
const kOnBordingScreen1Svg = 'assets/images/easy_fast_trusted.svg';
const kOnBordingScreen2Svg = 'assets/images/saving_money.svg';
const kOnBordingScreen3Svg = 'assets/images/multiple_credit_card.svg';
const kOtpImg = 'assets/images/otp_image.svg';
const kAppSmallImg = 'assets/images/p_pay_logo_small.png';
const kAppProfilelImg = 'assets/images/dummy_profile.jpg';

// Icon
const kGoogleIcon = 'assets/icons/google_icon.svg';
const kAppleIcon = 'assets/icons/apple_icon.svg';
const kFacebookIcon = 'assets/icons/facebook_icon.svg';
const kArrowBackIcon = 'assets/icons/arrow_back_icon.svg';
const kHomeIcon = 'assets/icons/home_icon.svg';
const kCardIcon = 'assets/icons/card_icon.svg';
const kActivityIcon = 'assets/icons/activity_icon.svg';
const kProfileIcon = 'assets/icons/profile_icon.svg';
const kScanIcon = 'assets/icons/scan_icon.svg';
const kSquareScanIcon = 'assets/icons/rectangle_qr_icon.svg';

// App Loader
const kAppLoder = 'assets/loder/loder.gif';

// URL

String BASE_URL = "http://10.81.10.14:83/api/";
// String BASE_URL = "http://10.81.11.62:4000/api/";
String IMAGE_BASE_URL = "http://10.81.10.14:83/uploads/";

// App Balance

RxDouble currentBalance = 0.0.obs;
