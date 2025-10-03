import 'package:flutter/material.dart';
import 'screens/category_selection_screen.dart';

void main() {
  runApp(const PustakaDigitalApp());
}

class PustakaDigitalApp extends StatelessWidget {
  const PustakaDigitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBluePurple = Color(0xFF6A6AD3);
    const Color lightBluePurple = Color(0xFF9B9BDC);
    const Color lightPeach = Color(0xFFF7DED0);

    return MaterialApp(
      title: 'Pustaka Digital FTI UNTAR',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: primaryBluePurple,
          onPrimary: Colors.white,
          secondary: lightBluePurple,
          onSecondary: Colors.white,
          surface: Color(0xFF1C1C2B),
          onSurface: lightPeach,
          background: Color(0xFF12121E),
          onBackground: Colors.white,
          error: Colors.redAccent,
          onError: Colors.white,
          tertiary: lightPeach,
          onTertiary: Colors.black,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12121E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1C1C2B),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: lightPeach,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: lightPeach),
        ),
        // =========================================================
        // PERBAIKAN DI SINI: Gunakan CardThemeData, bukan CardTheme
        // =========================================================
        cardTheme: CardThemeData(
          color: const Color(0xFF1C1C2B),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // =========================================================
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBluePurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: lightBluePurple,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF28283D),
          labelStyle: TextStyle(color: lightPeach.withOpacity(0.8)),
          hintStyle: TextStyle(color: lightPeach.withOpacity(0.6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: lightBluePurple, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF1C1C2B),
          selectedItemColor: primaryBluePurple,
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFF1C1C2B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          titleTextStyle: const TextStyle(color: lightPeach, fontSize: 20, fontWeight: FontWeight.w600),
          contentTextStyle: TextStyle(color: lightPeach.withOpacity(0.8)),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryBluePurple,
          contentTextStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          behavior: SnackBarBehavior.floating,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: lightBluePurple.withOpacity(0.2),
          labelStyle: TextStyle(color: lightPeach.withOpacity(0.9)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const CategorySelectionScreen(),
    );
  }
}