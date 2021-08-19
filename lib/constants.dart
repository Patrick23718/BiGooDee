import 'package:bigoodee/size_config.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

double screenWidth = SizeConfig.screenWidth;
const kPrimaryColor = Color(0xFFFF3E79);
// const kPrimaryLightColor = Color(0xFFFF3E79);
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
// );
const kSecondaryColor = Color(0xFFFFFFFF);
const kTerciaryColor = Color(0xFFFFB156);

const kErrorAlertColor = Color(0xFFFE4335);
const kWarAlertColor = Color(0xFFFFAA00);
const kSuccessAlertColor = Color(0xFF21A621);
const kborderColor = Color(0xFFEDEDED);
const kbackColor = Color(0xFFFFCEDD);
const kTextColor = Color(0xFF54514C);
const kTextTitleColor = Color(0xFF313131);
const kTextOnlyColor = Color(0xFF8C8C8C);

final headingStyle = TextStyle(
  fontSize: textMediumH1, //getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: kTextTitleColor,
);

final subHeadingStyle = TextStyle(
  fontSize: textRegularP1, //getProportionateScreenWidth(28),
  color: kTextTitleColor,
);
final normalStyleText = TextStyle(
  fontSize: textRegularP1, //getProportionateScreenWidth(28),
  color: kTextColor,
);

final normalStyle = TextStyle(
  fontSize: textRegularP2, //getProportionateScreenWidth(28),
  color: kTextTitleColor,
);

const apiURL = "http://93.90.207.75:8080";
const double textMediumH1 = 24;
const double textRegularH2 = 20;
const double textRegularH3 = 18;

const double textRegularP1 = 16;
const double textRegularP2 = 14;

const double titleInterligne = 25;
const double textInterligne = 15;

const double inputInterligne = 20;

const double iconHeight = 24;

const double defaultPadding = 30;

const double buttonHeight = 45;
