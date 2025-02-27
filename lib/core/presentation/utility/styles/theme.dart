import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainFont = GoogleFonts.sourceSans3;

ThemeData get basicTheme {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      headlineLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headlineMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headlineSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black.withValues(alpha: 0.6),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    iconTheme: const IconThemeData(
      size: 50,
      color: Colors.black,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        side: const BorderSide(color: Colors.black, width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        foregroundColor: Colors.grey,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0), // Focused border
      ),
    ),
  );
}