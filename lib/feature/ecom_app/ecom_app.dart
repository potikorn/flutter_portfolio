import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/ecom_main_app.dart';

class EcomApp extends StatelessWidget {
  const EcomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const EcomMainScreen(),
    );
  }
}
