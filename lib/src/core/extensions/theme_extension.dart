part of './extension.dart';

class ThemeExt {
  ThemeExt._();
  ColorExtension colorExtension = ColorExtension();

  static FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(80, 40),
      elevation: 1,
    ),
  );

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(80, 40),
        elevation: 1,
        backgroundColor: ColorExtension.primaryColor.withAlpha(35),
        side: const BorderSide(color: ColorExtension.primaryColor)),
  );
  static ElevatedButtonThemeData? elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(80, 40),
      elevation: 1,
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    filledButtonTheme: filledButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundLight,
    textTheme: extTextTheme,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorExtension.primaryColor,
      onPrimary: Colors.white,
      secondary: ColorExtension.primaryTextLight,
      onSecondary: Colors.white,
      error: ColorExtension.alternateColor,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: true,
    filledButtonTheme: filledButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundDark,
    textTheme: extTextTheme,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorExtension.primaryColorDark,
      onPrimary: Colors.white,
      secondary: ColorExtension.secondaryColor,
      onSecondary: Colors.black,
      error: ColorExtension.alternateColorDark,
      onError: Colors.white,
      background: ColorExtension.primaryBackgroundDark,
      onBackground: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
  );

  static const extTextTheme = TextTheme(
    displayLarge: TextStyle(letterSpacing: 0, fontSize: 32, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(letterSpacing: 0, fontSize: 32, fontWeight: FontWeight.w400),
    displaySmall: TextStyle(letterSpacing: 0, fontSize: 28, fontWeight: FontWeight.bold),
    //
    // headlineLarge: TextStyle(letterSpacing: 0),
    headlineMedium: TextStyle(letterSpacing: 0, fontSize: 16, fontWeight: FontWeight.w300),
    // headlineSmall: TextStyle(letterSpacing: 0),
    //
    titleLarge: TextStyle(letterSpacing: 0, fontSize: 14, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(letterSpacing: 0, fontSize: 14, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(letterSpacing: 0.5, fontSize: 14, fontWeight: FontWeight.w300),
    //
    labelLarge: TextStyle(fontSize: 12, letterSpacing: 0.5, fontWeight: FontWeight.w700),
    labelMedium: TextStyle(fontSize: 12, letterSpacing: 0.5, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 12, letterSpacing: 0.5, fontWeight: FontWeight.w300),
    //
    // bodyLarge: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0),
    bodyMedium: TextStyle(letterSpacing: 0, fontSize: 10),
    bodySmall: TextStyle(letterSpacing: 0, fontSize: 8),
  );
}
