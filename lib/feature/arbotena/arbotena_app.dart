import 'package:flutter/material.dart';
import 'ui/arbotena_main_screen.dart';

class ArbotenaApp extends StatelessWidget {
  const ArbotenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ArbotenaMainScreen(),
    );
  }
}