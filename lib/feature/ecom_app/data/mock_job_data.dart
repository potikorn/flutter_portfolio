import '../ui/components/job_item.dart';

class JobData {
  final String companyLogo;
  final JobStatus status;
  final String title;
  final String location;
  final String jobId;
  final String dateTime;

  JobData({
    required this.companyLogo,
    required this.status,
    required this.title,
    required this.location,
    required this.jobId,
    required this.dateTime,
  });
}

class MockJobData {
  static List<JobData> getMockJobs() {
    return [
      JobData(
        companyLogo: 'https://example.com/rewe.png',
        status: JobStatus.available,
        title: 'GP Niendorfer Getränkemarkt',
        location: 'Kieler Straße',
        jobId: '3588839',
        dateTime: '8 Mar 2022, 4:20PM',
      ),
      JobData(
        companyLogo: 'https://example.com/lidl.png',
        status: JobStatus.pickerAccepted,
        title: 'Lidl Supermarket',
        location: 'Leipziger Str. 42, 10117 Berlin',
        jobId: '4567898',
        dateTime: '8 Mar 2022, 4:20PM',
      ),
      JobData(
        companyLogo: 'https://example.com/rewe.png',
        status: JobStatus.riderAccepted,
        title: 'REWE City',
        location: 'Friedrichstraße 67-70, 10117 Berlin',
        jobId: '3588840',
        dateTime: '8 Mar 2022, 4:20PM',
      ),
      JobData(
        companyLogo: 'https://example.com/rewe.png',
        status: JobStatus.canceled,
        title: 'REWE City',
        location: 'Krausenstraße, 10117 Berlin',
        jobId: '3588841',
        dateTime: '8 Mar 2022, 4:20PM',
      ),
      JobData(
        companyLogo: 'https://example.com/rewe.png',
        status: JobStatus.canceledByManager,
        title: 'GP Niendorfer Getränkemarkt',
        location: 'Kieler Straße',
        jobId: '3588842',
        dateTime: '8 Mar 2022, 4:20PM',
      ),
      JobData(
        companyLogo: 'https://example.com/lidl.png',
        status: JobStatus.canceledByCustomer,
        title: 'Lidl Supermarket',
        location: 'Alexanderplatz 1, 10178 Berlin',
        jobId: '4567899',
        dateTime: '8 Mar 2022, 4:20PM',
      ),
    ];
  }

  static List<JobData> getJobsByStatus(JobStatus status) {
    return getMockJobs().where((job) => job.status == status).toList();
  }

  static List<JobData> getAvailableJobs() {
    return getMockJobs().where((job) => job.status == JobStatus.available).toList();
  }

  static List<JobData> getAcceptedJobs() {
    return getMockJobs().where((job) => 
      job.status == JobStatus.pickerAccepted || 
      job.status == JobStatus.riderAccepted
    ).toList();
  }

  static List<JobData> getCanceledJobs() {
    return getMockJobs().where((job) => 
      job.status == JobStatus.canceled || 
      job.status == JobStatus.canceledByManager || 
      job.status == JobStatus.canceledByCustomer
    ).toList();
  }
}
