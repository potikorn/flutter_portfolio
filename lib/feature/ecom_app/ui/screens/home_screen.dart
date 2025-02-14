import 'package:flutter/material.dart';
import '../components/job_item.dart';
import '../components/area_list_section.dart';
import '../styles/app_styles.dart';
import '../../data/mock_job_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final availableJobs = MockJobData.getAvailableJobs()
        .map((job) => JobItem(
              companyLogo: job.companyLogo,
              status: job.status,
              title: job.title,
              location: job.location,
              jobId: job.jobId,
              dateTime: job.dateTime,
              onAcceptPicker: () {
                // Handle accept picker
              },
              onAcceptRider: () {
                // Handle accept rider
              },
            ))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo,',
                    style: AppStyles.screenTitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'John Does',
                        style: AppStyles.nameStyle,
                      ),
                      Text(
                        'Rider & Picker',
                        style: AppStyles.roleStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'johndoes@gmail.com',
                        style: AppStyles.emailStyle,
                      ),
                      Text(
                        '5609812739',
                        style: AppStyles.phoneStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const AreaListSection(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available jobs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See Job List',
                      style: TextStyle(
                        color: AppStyles.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...availableJobs.take(1),
            ],
          ),
        ),
      ),
    );
  }
}
