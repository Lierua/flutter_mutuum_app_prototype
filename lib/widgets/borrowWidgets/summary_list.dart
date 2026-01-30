import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class SummaryItem {
  String title;
  double amount;

  SummaryItem({required this.title, required this.amount});
}

class SummaryList extends StatelessWidget {
  final List<SummaryItem> list;
  final String label;
  const SummaryList({super.key, required this.list, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.overTitle),
        SizedBox(height: AppSizes.spacingInside),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: AppColors.lightColor, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.boxPadding),
            child: Column(
              children: list.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(item.title, style: AppTextStyles.pText),
                      ),
                      Text(
                        "${item.amount.toStringAsFixed(0)} kr.",
                        style: AppTextStyles.pText,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
