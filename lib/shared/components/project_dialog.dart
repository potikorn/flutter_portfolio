import 'package:flutter/material.dart';
import 'package:flutter_portfolio/shared/components/device_preview_container.dart';
import 'package:flutter_portfolio/shared/theme/app_theme.dart';

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
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 768) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Left side - Project details
                            if (project.detail != null)
                              ProjectDetailView(detail: project.detail!),
                            const SizedBox(height: 32),
                            // Right side - Preview
                            Container(
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
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.accentLight,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: project.appEntry != null
                                        ? LayoutBuilder(
                                            builder: (context, constraints) {
                                              if (constraints.maxWidth < 500) {
                                                return FilledButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Stack(
                                                          children: [
                                                            Center(
                                                              child:
                                                                  DevicePreviewContainer(
                                                                width: 375,
                                                                height: 667,
                                                                child: project
                                                                    .appEntry!,
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              top: 0,
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons.close,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Open in Full Screen',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Icon(
                                                        Icons.open_in_full,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return DevicePreviewContainer(
                                                  width: 375,
                                                  height: 667,
                                                  child: project.appEntry!,
                                                );
                                              }
                                            },
                                          )
                                        : Placeholder(
                                            fallbackHeight: 667,
                                            fallbackWidth: constraints.maxWidth,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side - Project details
                            if (project.detail != null)
                              Expanded(
                                child: ProjectDetailView(
                                  detail: project.detail!,
                                ),
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
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                        );
                      }
                    },
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
