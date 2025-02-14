import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final List<Widget> items;
  final int initialVisibleItems;

  const ExpandableSection({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    required this.items,
    this.initialVisibleItems = 1,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final visibleItems = _isExpanded 
        ? widget.items 
        : widget.items.take(widget.initialVisibleItems).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: AppStyles.sectionTitle),
            if (widget.actionText != null)
              TextButton(
                onPressed: widget.onActionTap,
                child: Text(
                  widget.actionText!,
                  style: const TextStyle(
                    color: AppStyles.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        ...visibleItems,
        if (widget.items.length > widget.initialVisibleItems)
          Center(
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: Icon(
                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppStyles.primaryColor,
              ),
              label: Text(
                _isExpanded ? 'See Less' : 'See More',
                style: const TextStyle(
                  color: AppStyles.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
