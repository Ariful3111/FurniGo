import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF15003B);
  static const Color secondaryColor = Color(0xFF15003A);
  static const Color darkColor = Color(0xFF000000);
  static const Color titleColor = Color(0xFF101828);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color grayBorderColor = Color(0xFFBEBEBE);
  static const Color darkTextColor = Color(0xFF0A0A0F);
  static const Color darkTitleColor = Color(0xFF161616);
  static const Color titleTextColor = Color(0xFF0A0D14);
  static const Color greyTextColor = Color(0xFF4C4C4C);
  static const Color primaryGreyTextColor = Color(0xFF42526D);
  static const Color greyColor = Color(0xFF6A7282);
  static const Color darkGreyColor = Color(0xFF222222);
  static const Color darkSecondaryColor = Color(0xFF212121);
  static const Color lightGreyColor = Color(0xFF364153);
  static const Color lightTextColor = Color(0xFF737373);
  static const Color boxColor = Color(0xFFE8E6EB);
  static const Color errorColor = Color(0xFFEC1010);
  static const Color containerColor = Color(0xFFF3F3F3);
  static const Color secondaryTextColor = Color(0xFF4A5565);
  static const Color errorTextColor = Color(0xFF733E0A);
  static const Color errorTextColor2 = Color(0xFFA65F00);
  static const Color errorBorderColor = Color(0xFFFFF085);
  static const Color errorContainerColor = Color(0xFFFEFCE8);
  static const Color errorIconColor = Color(0xFFD08700);
  static const Color buttonTextColor = Color(0xFF2E2E2E);
  static const Color acceptButtonColor = Color(0xFF38C793);
  static const Color fieldTextColorDark = Color(0xFF2A2A2A);
  static const Color fieldTextColor = Color(0xFF9F9F9F);
  static const Color fieldBorderColor = Color(0xFFEAEAEA);
  static const Color fieldBorderColorLight = Color(0xFFE5E7EB);
  static const Color primaryBorderColor = Color(0xFFE9E9E9);
  static const Color whiteBorderColor = Color(0xFFB6B0C2);
  static const Color fieldColor = Color(0xFFF2F2F2);
  static const Color labelColor = Color(0xFF1F1F1F);
  static const Color shadowColor = Color(0xFF14142B);
  static const Color borderColor = Color(0xFFE5E9EE);
  static const Color buttonBorderColor = Color(0xFFD1D7E0);
  static const Color pendingBGColor = Color(0xFFFFF3D0);
  static const Color pendingTextColor = Color(0xFFB49948);
  static const Color quoteBGColor = Color(0xFFDFE2FF);
  static const Color quoteTextColor = Color(0xFF6155F5);
  static const Color reviseBGColor = Color(0xFFCCF0FF);
  static const Color reviseTextColor = Color(0xFF106D93);
  static const Color activeBGColor = Color(0xFFDCFCE7);
  static const Color activeTextColor = Color(0xFF008236);
  static const Color completeBgColor = Color(0xFF9B9B9B);
  static const Color completeTextColor = Color(0xFFE6E6E6);
  static const Color rejectedBGColor = Color(0xFFFFD3D3);
  static const Color rejectedTextColor = Color(0xFFFF2828);
  static const Color successColor = Color(0xFF38C793);

  // Dark Colors

  static const Color darkBorderColor = Color(0xFF434953);
  static const Color darkPrimaryTextColor = Color(0xFFBABABA);
  static const Color darkGreyTextColor = Color(0xFF585858);
  static const Color darkPendingBGColor = Color(0xFF6B5A2B);
  static const Color darkPendingTextColor = Color(0xFFFFFBF0);
  static const Color darkQuoteBGColor = Color(0xFF6155F5);
  static const Color darkQuoteTextColor = Color(0xFFDFE2FF);
  static const Color darkReviseBGColor = Color(0xFF106D93);
  static const Color darkReviseTextColor = Color(0xFFCCF0FF);
  static const Color darkActiveBGColor = Color(0xFF0E5843);
  static const Color darkActiveTextColor = Color(0xFFE9FAF5);
  static const Color darkCompleteBgColor = Color(0xFF05393B);
  static const Color darkCompleteTextColor = Color(0xFFE7F3F4);
  static const Color darkRejectedBGColor = Color(0xFFBF1F1F);
  static const Color darkRejectedTextColor = Color(0xFFFFD3D3);
  static const Color darkErrorBG = Color(0xFF6B5A2B);
  static const Color darkErrorBorder = Color(0xFFB49948);

  //Gradient Colors
  static Gradient authBG = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      whiteColor.withValues(alpha: 0.2),
      whiteColor,
      whiteColor,
      whiteColor,
    ],
  );
  static LinearGradient darkAuthBG = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkColor.withValues(alpha: 0.2),
      darkColor,
      darkColor,
      darkColor,
      darkColor,
    ],
  );
  static Gradient primaryBG = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF6F2FF), Color(0xFFF9F2FF)],
  );
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF15003A), Color(0xFF3A00A0)],
  );
  static Gradient secondaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1348D2), Color(0xFF1B6ADD), Color(0xFF209DF0)],
  );
  static LinearGradient darkPrimaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFBBA0EB), Color(0xFFAE45FA)],
  );
  static Gradient bannerBG = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1348D2), Color(0xFF1B6ADD), Color(0xFF209DF0)],
  );

 static List<Color> productColorList = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];
}
