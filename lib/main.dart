import 'package:flutter/material.dart';
import 'package:flutter_portfolio/shared/components/project_grid.dart';
import 'package:flutter_portfolio/shared/theme/app_theme.dart';

import 'shared/components/header.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Mobile Developer Portfolio',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final projectsKey = GlobalKey();
  final aboutKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.backgroundPrimary,
              Colors.white,
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              floating: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Text(
                      'Portfolio',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                          projectsKey.currentContext!,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text('Projects'),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                          aboutKey.currentContext!,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      child: const Text('About'),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 48),
                        const Header(),
                        const SizedBox(height: 48),
                        Text(
                          'Featured Projects',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 24),
                        ProjectsGrid(key: projectsKey),
                        const SizedBox(height: 48),
                        // ProfileSection(key: aboutKey),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
