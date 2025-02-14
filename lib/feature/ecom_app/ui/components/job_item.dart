import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/styles/app_styles.dart';

enum JobStatus {
  available,
  pickerAccepted,
  riderAccepted,
  canceled,
  canceledByManager,
  canceledByCustomer,
}

extension JobStatusExtension on JobStatus {
  String get label {
    switch (this) {
      case JobStatus.available:
        return 'Available';
      case JobStatus.pickerAccepted:
        return 'Picker Accepted';
      case JobStatus.riderAccepted:
        return 'Rider Accepted';
      case JobStatus.canceled:
        return 'Canceled';
      case JobStatus.canceledByManager:
        return 'Canceled by Manager';
      case JobStatus.canceledByCustomer:
        return 'Canceled by Customer';
    }
  }

  Color get color {
    switch (this) {
      case JobStatus.available:
        return Colors.green;
      case JobStatus.pickerAccepted:
        return Colors.blue;
      case JobStatus.riderAccepted:
        return Colors.blue;
      case JobStatus.canceled:
        return Colors.red;
      case JobStatus.canceledByManager:
        return Colors.red;
      case JobStatus.canceledByCustomer:
        return Colors.red;
    }
  }

  Color get backgroundColor {
    return color.withOpacity(0.1);
  }
}

class JobItem extends StatelessWidget {
  final String companyLogo;
  final JobStatus status;
  final String title;
  final String location;
  final String jobId;
  final String dateTime;
  final VoidCallback? onAcceptPicker;
  final VoidCallback? onAcceptRider;

  const JobItem({
    super.key,
    required this.companyLogo,
    required this.status,
    required this.title,
    required this.location,
    required this.jobId,
    required this.dateTime,
    this.onAcceptPicker,
    this.onAcceptRider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  companyLogo,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey[200],
                      child: const Icon(Icons.business, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: status.backgroundColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status.label,
                        style: TextStyle(
                          fontSize: 14,
                          color: status.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "#$jobId",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          dateTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (status == JobStatus.available ||
              status == JobStatus.pickerAccepted ||
              status == JobStatus.riderAccepted) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAcceptPicker,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Accept Picker',
                      style: AppStyles.buttonSmallText,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: onAcceptRider,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppStyles.primaryColor,
                      side: const BorderSide(color: AppStyles.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Accept Rider',
                      style: AppStyles.buttonSmallText.copyWith(
                        color: AppStyles.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
