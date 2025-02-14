import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/ecom_app/ui/styles/app_styles.dart';

class AreaListSection extends StatefulWidget {
  const AreaListSection({super.key});

  @override
  State<AreaListSection> createState() => _AreaListSectionState();
}

class _AreaListSectionState extends State<AreaListSection> {
  bool _isAreasExpanded = false;

  Widget _buildAreaItem({
    required String name,
    required String distance,
    required String address,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppStyles.primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$distance · $address',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAreaItems() {
    return [
      _buildAreaItem(
        name: 'Lidl',
        distance: '3.2km',
        address: 'Leipziger Str. 42, 10117 Berlin, Germany',
      ),
      if (_isAreasExpanded) ...[
        _buildAreaItem(
          name: 'REWE City',
          distance: '3.2km',
          address: 'Friedrichstraße 67-70, 10117 Berlin, Germany',
        ),
        _buildAreaItem(
          name: 'Store A',
          distance: '3.2km',
          address: 'Krausenstraße, 10117 Berlin, Germany',
        ),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Selected Areas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Manage Areas',
                style: TextStyle(
                  color: AppStyles.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ..._buildAreaItems(),
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _isAreasExpanded = !_isAreasExpanded;
                      });
                    },
                    icon: Icon(
                      _isAreasExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppStyles.primaryColor,
                    ),
                    label: Text(
                      _isAreasExpanded
                          ? 'See Less added areas'
                          : 'See More added areas',
                      style: const TextStyle(color: AppStyles.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
