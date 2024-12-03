import 'dart:ui';

abstract class AppColor{

  /// primary

  static const primaryDefault = Color(0xff56ab84);
  static const primaryShade1 = Color(0xff1ca866);

  /// secondary
  static const secondaryDefault = Color(0xff8AC53E);

  /// text
  static const textPrimary = Color(0xff060028);
  static const textSecondary = Color(0xff44405E);
  static const textTertiary = Color(0xff828093);
  static const textDisabled = Color(0xffCDCCD4);
  static const textWhite = Color(0xffFFFFFF);

  ///Semantics
  static const semanticsSuccess = Color(0xff8CC340);
  static const semanticsInfo = Color(0xff4EAFF3);
  static const semanticsWarning = Color(0xffF6C25B);
  static const semanticsError = Color(0xffEB4C3A);

  ///Neutrals
  static const neutralsBg = Color(0xffFFFFFF);
  static const neutralCards = Color(0xffFFFFFF);
  static const neutralFields = Color(0xffF3F3F5);
  static const neutralStroke = Color(0xffE5E5E5);
}
