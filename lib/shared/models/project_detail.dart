import 'package:flutter/material.dart';

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
  final MaterialColor color;

  TechStackItem({
    required this.label,
    required this.color,
  });
}

class ProjectDetail {
  final String title;
  final String subtitle;
  final IconData icon;
  final MaterialColor iconColor;
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
