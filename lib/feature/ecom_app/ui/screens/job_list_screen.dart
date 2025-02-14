import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/styles/app_styles.dart';
import '../../data/mock_job_data.dart';
import '../components/job_item.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Job List',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: AppStyles.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppStyles.primaryColor,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Available'),
              Tab(text: 'Accepted'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildJobList(MockJobData.getMockJobs()),
            _buildJobList(MockJobData.getAvailableJobs()),
            _buildJobList(MockJobData.getAcceptedJobs()),
            _buildJobList(MockJobData.getCanceledJobs()),
          ],
        ),
      ),
    );
  }

  Widget _buildJobList(List<JobData> jobs) {
    if (jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No accepted jobs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'A list of accepted jobs will be\ndisplayed here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Find Jobs',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return JobItem(
          companyLogo: job.companyLogo,
          status: job.status,
          title: job.title,
          location: job.location,
          jobId: job.jobId,
          dateTime: job.dateTime,
          onAcceptPicker: job.status == JobStatus.available
              ? () {
                  // Handle accept picker
                }
              : null,
          onAcceptRider: job.status == JobStatus.available
              ? () {
                  // Handle accept rider
                }
              : null,
        );
      },
    );
  }
}
