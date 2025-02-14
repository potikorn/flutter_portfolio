import 'package:flutter/material.dart';
import 'project_detail.dart';

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
