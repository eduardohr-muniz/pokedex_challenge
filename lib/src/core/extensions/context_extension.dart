part of './extension.dart';

extension ContextExtension on BuildContext {
  Color get primaryColor => Theme.of(this).brightness == Brightness.light ? ColorExtension.primaryColor : ColorExtension.primaryColorDark;

  Color get secondaryColor => ColorExtension.secondaryColor;

  Color get tertiaryColor => Theme.of(this).brightness == Brightness.light ? ColorExtension.tertiaryColor : ColorExtension.tertiaryColorDark;
  Color get alternateColor => Theme.of(this).brightness == Brightness.light ? ColorExtension.alternateColor : ColorExtension.alternateColorDark;

  Color get primaryBgColor =>
      Theme.of(this).brightness == Brightness.light ? ColorExtension.primaryBackgroundLight : ColorExtension.primaryBackgroundDark;

  Color get secondaryBgColor =>
      Theme.of(this).brightness == Brightness.light ? ColorExtension.secondaryBackgroundLight : ColorExtension.secondaryBackgroundDark;

  Color get primaryTextColor => Theme.of(this).brightness == Brightness.light ? ColorExtension.primaryTextLight : ColorExtension.primaryTextDark;

  Color get secondaryTextColor =>
      Theme.of(this).brightness == Brightness.light ? ColorExtension.secondaryTextLight : ColorExtension.secondaryTextDark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ButtonStyle get buttonPrimary => ElevatedButton.styleFrom(backgroundColor: primaryColor);

  double get spacing => 20;

  ///Mediaquery.size.width[w]
  double get w => MediaQuery.sizeOf(this).width;

  ///Mediaquery.size.height[h]
  double get h => MediaQuery.sizeOf(this).height;

  ///Only numbers regex
  RegExp get rgxNumber => RegExp(r'\d+');

  InputDecorationTheme get inputDecorationThemePrimary => InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      filled: true,
      focusColor: primaryColor,
      hoverColor: primaryColor.withOpacity(0.2),
      prefixIconColor: primaryColor);
}
