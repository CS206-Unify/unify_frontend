import "package:flutter/material.dart";

class MaterialTheme {
  const MaterialTheme();

// Light Theme
  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF7B2CDE),
      surfaceTint: Color(0xff6A538C),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffEDDCFF),
      onPrimaryContainer: Color(0xff280056),
      secondary: Color(0xff7e4e7c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffFFD6F9),
      onSecondaryContainer: Color(0xff37003B),
      tertiary: Color(0xff834594),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffFBD7FF),
      onTertiaryContainer: Color(0xff330044),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffef7ff),
      onBackground: Color(0xff1d1a20),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1a20),
      surfaceVariant: Color(0xffe8e0eb),
      onSurfaceVariant: Color(0xff4a454e),
      outline: Color(0xff7b757f),
      outlineVariant: Color(0xffCBC4CF),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inverseOnSurface: Color(0xfff6eef7),
      inversePrimary: Color(0xffD7BAFF),
      primaryFixed: Color(0xffEDDCFF),
      onPrimaryFixed: Color(0xff280056),
      primaryFixedDim: Color(0xffD7BAFF),
      onPrimaryFixedVariant: Color(0xff6100BE),
      secondaryFixed: Color(0xffFFD6F9),
      onSecondaryFixed: Color(0xff37003B),
      secondaryFixedDim: Color(0xffFFA9FC),
      onSecondaryFixedVariant: Color(0xff7E0287),
      tertiaryFixed: Color(0xffFBD7FF),
      onTertiaryFixed: Color(0xff330044),
      tertiaryFixedDim: Color(0xffF0AFFF),
      onTertiaryFixedVariant: Color(0xff682D7B),
      surfaceDim: Color(0xffdfd8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

// Dark Theme
  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffD7BAFF),
      surfaceTint: Color(0xffD6BBFB),
      onPrimary: Color(0xff430088),
      primaryContainer: Color(0xff6100BE),
      onPrimaryContainer: Color(0xffEDDCFF),
      secondary: Color(0xffFFA9FC),
      onSecondary: Color(0xff590060),
      secondaryContainer: Color(0xff7E0287),
      onSecondaryContainer: Color(0xffFFD6F9),
      tertiary: Color(0xffF0AFFF),
      onTertiary: Color(0xff4F1262),
      tertiaryContainer: Color(0xff682D7B),
      onTertiaryContainer: Color(0xffFBD7FF),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff001F2A),
      onBackground: Color(0xffBFE9FF),
      surface: Color(0xff1C1B1B),
      onSurface: Color(0xffBFE9FF),
      surfaceVariant: Color(0xff4a454e),
      onSurfaceVariant: Color(0xffcbc4cf),
      outline: Color(0xff958e99),
      outlineVariant: Color(0xff4a454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inverseOnSurface: Color(0xff322f35),
      inversePrimary: Color(0xff7B2CDE),
      primaryFixed: Color(0xffEDDCFF),
      onPrimaryFixed: Color(0xff250E44),
      primaryFixedDim: Color(0xffD7BAFF),
      onPrimaryFixedVariant: Color(0xff6100BE),
      secondaryFixed: Color(0xffFFD6F9),
      onSecondaryFixed: Color(0xff320935),
      secondaryFixedDim: Color(0xffFFA9FC),
      onSecondaryFixedVariant: Color(0xff7E0287),
      tertiaryFixed: Color(0xffFBD7FF),
      onTertiaryFixed: Color(0xff2F0A3A),
      tertiaryFixedDim: Color(0xffE7B6F0),
      onTertiaryFixedVariant: Color(0xff682D7B),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff100d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff37333a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

// Fonts Setup
  TextTheme text() {
    return const TextTheme(
      displayLarge: TextStyle(fontFamily: "Roboto_Slab"),
      displayMedium: TextStyle(fontFamily: "Roboto_Slab"),
      displaySmall: TextStyle(fontFamily: "Roboto_Slab"),
      headlineLarge: TextStyle(fontFamily: "Righteous"),
      headlineMedium: TextStyle(fontFamily: "Righteous"),
      headlineSmall: TextStyle(fontFamily: "Righteous"),
      titleLarge: TextStyle(fontFamily: "Poppins"),
      titleMedium: TextStyle(fontFamily: "Poppins"),
      titleSmall: TextStyle(fontFamily: "Poppins"),
      // Label and Body just inherit robotoTextTheme
    );
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: text().apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}
