import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/ecom_app/ecom_app.dart';
import 'package:flutter_portfolio/shared/components/device_preview_container.dart';
import '../theme/app_theme.dart';

class ProjectsGrid extends StatelessWidget {
  ProjectsGrid({super.key});

  final List<ProjectData> projects = [
    ProjectData(
      title: 'E-commerce App',
      description: 'A modern e-commerce application with clean UI',
      mockupImage: 'assets/ecommerce_mockup.png',
      appEntry: const EcomApp(),
      detail: ProjectDetail(
        title: 'Delivery Staff Management',
        subtitle: 'E-commerce App',
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
      title: 'Social Media App',
      description: 'Feature-rich social networking platform',
      mockupImage: 'assets/social_mockup.png',
      detail: ProjectDetail(
        title: 'Social Networking Platform',
        subtitle: 'Social Media App',
        icon: Icons.people,
        iconColor: AppTheme.blue,
        description:
            'A modern social networking platform built with Flutter, enabling users to connect, share, and interact in real-time.',
        features: [
          ProjectFeature(
            icon: Icons.chat_bubble,
            title: 'Real-time Messaging',
            description:
                'Instant messaging with read receipts and typing indicators',
          ),
          ProjectFeature(
            icon: Icons.photo_library,
            title: 'Media Sharing',
            description: 'Share photos, videos, and stories with your network',
          ),
          ProjectFeature(
            icon: Icons.group,
            title: 'Group Features',
            description: 'Create and manage groups with shared interests',
          ),
        ],
        techStack: [
          TechStackItem(label: 'Flutter', color: AppTheme.blue),
          TechStackItem(label: 'Firebase', color: AppTheme.navy),
          TechStackItem(label: 'WebRTC', color: AppTheme.darkNavy),
        ],
        previewNote:
            'Experience the interactive demo of our social platform. Note that some features like real-time messaging are simulated in this preview.',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return ProjectCard(project: project);
      },
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

class ProjectDialog extends StatelessWidget {
  final ProjectData project;

  const ProjectDialog({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1024, maxHeight: 960),
        decoration: BoxDecoration(
          color: AppTheme.backgroundSecondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: AppTheme.backgroundSecondary,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                border: Border(bottom: BorderSide(color: AppTheme.borderColor)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: AppTheme.textSecondary),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side - Project details
                      if (project.detail != null)
                        Expanded(
                          child: ProjectDetailView(detail: project.detail!),
                        )
                      else
                        Expanded(
                          child: Text(
                            project.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      const SizedBox(width: 32),
                      // Right side - Preview
                      Container(
                        width: 415,
                        decoration: BoxDecoration(
                          color: AppTheme.backgroundSecondary,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.borderColor),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Live Preview (Mock Up)',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.accentLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: project.appEntry != null
                                  ? DevicePreviewContainer(
                                      width: 375,
                                      height: 667,
                                      child: project.appEntry!,
                                    )
                                  : const Placeholder(
                                      fallbackHeight: 667,
                                      fallbackWidth: 375,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class ProjectData {
  final String title;
  final String description;
  final String mockupImage;
  final Widget? appEntry;
  final ProjectDetail? detail;

  ProjectData({
    required this.title,
    required this.description,
    required this.mockupImage,
    this.appEntry,
    this.detail,
  });
}

class ProjectDetail {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String description;
  final List<ProjectFeature> features;
  final List<TechStackItem> techStack;
  final String previewNote;

  ProjectDetail({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.description,
    required this.features,
    required this.techStack,
    required this.previewNote,
  });
}

class ProjectFeature {
  final IconData icon;
  final String title;
  final String description;

  ProjectFeature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class TechStackItem {
  final String label;
  final Color color;

  TechStackItem({
    required this.label,
    required this.color,
  });
}

class ProjectDetailView extends StatelessWidget {
  final ProjectDetail detail;

  const ProjectDetailView({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(detail.icon, color: detail.iconColor),
            const SizedBox(width: 12),
            Text(
              detail.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          detail.description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 24),
        // Features section
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Features',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              ...detail.features.map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(feature.icon,
                            color: Colors.blue[700], size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              feature.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              feature.description,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Tech stack section
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tech Stack',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: detail.techStack.map((tech) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: tech.color,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: tech.color),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.code, size: 16, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          tech.label,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Note about preview
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue[100]!),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue[700]),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  detail.previewNote,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.blue[900],
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
