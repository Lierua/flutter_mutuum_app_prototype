import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_prototype/theme/app-theme-variables.dart';

class DateSetting extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  final ValueChanged<DateTime> onStartChanged;
  final ValueChanged<DateTime> onEndChanged;

  const DateSetting({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onStartChanged,
    required this.onEndChanged,
  });

  @override
  State<DateSetting> createState() => _DateSettingState();
}

class _DateSettingState extends State<DateSetting> {
  // English month format (Dec 2026)
  final _formatter = DateFormat('MMM yyyy'); // no locale

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();

    final initialDate = isStart
        ? widget.startDate ?? now
        : widget.endDate ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 30),
      helpText: isStart ? "Select start month" : "Select end month",
    );

    if (picked == null) return;

    // Normalize to first day of month
    final normalized = DateTime(picked.year, picked.month);

    if (isStart) {
      widget.onStartChanged(normalized);
    } else {
      widget.onEndChanged(normalized);
    }
  }

  String _format(DateTime? date) {
    if (date == null) return "Select month";
    return _formatter.format(date);
  }

  Widget _buildRow({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Expanded(child: Text(label, style: AppTextStyles.pText)),

            Text(
              value,
              style: AppTextStyles.pText.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(width: 6),

            const Icon(Icons.calendar_month, size: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(
          label: "Start period",
          value: _format(widget.startDate),
          onTap: () => _pickDate(isStart: true),
        ),

        const Divider(),

        _buildRow(
          label: "End period",
          value: _format(widget.endDate),
          onTap: () => _pickDate(isStart: false),
        ),

        const Divider(),
      ],
    );
  }
}
