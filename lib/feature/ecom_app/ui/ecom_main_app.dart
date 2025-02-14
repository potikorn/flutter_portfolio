import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/screens/home_screen.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/screens/job_list_screen.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/screens/profile_screen.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/components/bottom_nav_bar.dart';

class EcomMainScreen extends StatefulWidget {
  const EcomMainScreen({super.key});

  @override
  State<EcomMainScreen> createState() => _EcomMainScreenState();
}

class _EcomMainScreenState extends State<EcomMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const JobListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
