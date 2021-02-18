part of 'shared.dart';

const double defaultMargin = 20;

Color mainColor0 = "0080F6".toColor();
Color mainColor1 = "2998FF".toColor();

Color kBackgroundColor = "F5FAFF".toColor();
Color blackColor = "001B33".toColor();
Color successColor = "64BC26".toColor();
Color dangerColor = "EA1601".toColor();

Color greyColor0 = "001B33".toColor().withOpacity(0.6);
Color greyColor1 = "001B33".toColor().withOpacity(0.3);
Color lightGreyColor = "EBECF1".toColor();

TextStyle titleFontStyle0 = GoogleFonts.poppins().copyWith(
    color: blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3);
TextStyle titleFontStyle1 = GoogleFonts.poppins().copyWith(
    color: blackColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3);
TextStyle blackFontStyle0 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 18, fontWeight: FontWeight.w400);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 16, fontWeight: FontWeight.w400);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontSize: 14, fontWeight: FontWeight.w400);

TextStyle whiteLabelStyle = GoogleFonts.poppins(color: Colors.white);
TextStyle whiteHintStyle = GoogleFonts.poppins(color: Colors.white54);
TextStyle greyFontStyle = GoogleFonts.poppins(fontSize: 14, color: greyColor1);
