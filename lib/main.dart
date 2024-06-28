import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conference/app/routes/app_pages.dart';
import 'package:video_conference/utils/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Video Conference',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24),
          bodyMedium: TextStyle(fontSize: 20),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: MyColor.primary,
          brightness: Brightness.dark,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
