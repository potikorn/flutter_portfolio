import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/arbotena/arbotena_app.dart';
import 'package:flutter_portfolio/feature/ecom_app/ecom_app.dart';
import 'package:flutter_portfolio/shared/components/project_dialog.dart';
import '../theme/app_theme.dart';

class ProjectGridView extends StatelessWidget {
  ProjectGridView({super.key});

  final List<ProjectData> projects = [
    ProjectData(
      title: 'E-Com App',
      description:
          'A modern staff management e-comm application with clean UI. The first app in Germany that delivers groceries from super markets directly to your front door in a few minutes.',
      mockupImage: 'assets/cover/ecom_app_cover.png',
      appEntry: const EcomApp(),
      detail: ProjectDetail(
        title: 'Delivery Staff Management',
        subtitle: 'E-Com App',
        icon: Icons.delivery_dining,
        iconColor: AppTheme.blue,
        description:
            'A sophisticated Flutter-based mobile application designed for delivery staff in Germany. This app streamlines the process of product picking and delivery, featuring:',
        features: [
          ProjectFeature(
            icon: Icons.track_changes,
            title: 'Real-time Order Tracking',
            description: 'Monitor orders and delivery status in real-time',
          ),
          ProjectFeature(
            icon: Icons.map,
            title: 'Interactive Map Interface',
            description:
                'View store locations, rider positions, and customer destinations',
          ),
          ProjectFeature(
            icon: Icons.shopping_basket,
            title: 'Order Picking System',
            description:
                'Efficient system for store staff to manage product picking',
          ),
          ProjectFeature(
            icon: Icons.route,
            title: 'Optimized Routing',
            description: 'Smart delivery route optimization for riders',
          ),
        ],
        techStack: [
          TechStackItem(label: 'Flutter', color: AppTheme.blue),
          TechStackItem(label: 'Google Maps API', color: AppTheme.navy),
          TechStackItem(label: 'Geolocation', color: AppTheme.darkNavy),
          TechStackItem(label: 'Real-time Updates', color: AppTheme.blue),
        ],
        previewNote:
            'Try the interactive preview to explore the app\'s features! Note that this is a demo version - map services and real-time tracking are simulated for demonstration purposes.',
      ),
    ),
    ProjectData(
      title: 'Arbotena',
      description:
          'AI-powered health assessment app that helps users identify potential food allergies and intolerances through comprehensive questionnaires and product scanning.',
      mockupImage: 'assets/cover/arbotena_cover.png',
      appEntry: const ArbotenaApp(),
      detail: ProjectDetail(
        title: 'Arbotena - AI Health Assessment',
        subtitle: 'Revolutionizing Food Allergy & Intolerance Detection',
        icon: Icons.people,
        iconColor: AppTheme.blue,
        description:
            'A modern social networking platform built with React Native, enabling users to connect, share, and interact in real-time.',
        features: [
          ProjectFeature(
            icon: Icons.chat_bubble,
            title:
                'Comprehensive health questionnaire covering physical appearance, symptoms, and current health status',
            description:
                'AI-powered analysis based on real doctor diagnosis datasets',
          ),
          ProjectFeature(
            icon: Icons.photo_library,
            title: 'Product label scanning to check ingredient compatibility',
            description: 'Personalized food and ingredient recommendations',
          ),
          ProjectFeature(
            icon: Icons.group,
            title: 'Detailed allergy and intolerance profiles',
            description:
                'Easy-to-use interface with clear results visualization',
          ),
        ],
        techStack: [
          TechStackItem(
              label: 'React Native (Typescript)', color: AppTheme.blue),
          TechStackItem(label: 'Machine Learning', color: AppTheme.darkNavy),
          TechStackItem(label: 'Computer Vision', color: AppTheme.blue),
          TechStackItem(label: 'Health Data Analytics', color: AppTheme.navy),
        ],
        previewNote:
            'This app demonstrates how AI can transform traditional medical processes into accessible digital solutions while maintaining professional medical standards.',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROJECTS',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 48),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 450,
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return ProjectCard(project: project);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectData project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ProjectDialog(project: project),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.accentLight,
                ),
                child: Image.asset(
                  project.mockupImage,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                border: Border(
                  top: BorderSide(color: AppTheme.borderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
