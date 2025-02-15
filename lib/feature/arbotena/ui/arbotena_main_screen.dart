import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'scan_screen.dart';
import 'profile_screen.dart';

class ArbotenaMainScreen extends StatefulWidget {
  const ArbotenaMainScreen({super.key});

  @override
  State<ArbotenaMainScreen> createState() => _ArbotenaMainScreenState();
}

class _ArbotenaMainScreenState extends State<ArbotenaMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ScanScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: const Color(0xFFD4AF37),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Produkte',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.person_outline),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 8,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}