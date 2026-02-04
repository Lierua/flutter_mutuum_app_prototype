import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/check_mark.dart';

class AccountItem {
  String title;
  double amount;
  bool checked;

  AccountItem({
    required this.checked,
    required this.title,
    required this.amount,
  });
}

class SavingsList extends StatelessWidget {
  final List<AccountItem> list;
  final ValueChanged<int> onToggle;
  final String label;

  const SavingsList({
    super.key,
    required this.list,
    required this.label,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.pText),
        SizedBox(height: AppSizes.spacingInside),

        Container(
          decoration: BoxDecoration(
            /*             borderRadius: BorderRadius.circular(2),
            border: Border.all(color: AppColors.lightColor, width: 2), */
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.boxPadding,
            ),
            child: Column(
              children: [
                ...list.asMap().entries.map((entry) {
                  final index = entry.key;
                  final debt = entry.value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        CircleCheckbox(
                          value: debt.checked,
                          onChanged: (_) => onToggle(index),
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(debt.title, style: AppTextStyles.pText),
                        ),

                        Text(
                          "${debt.amount.toStringAsFixed(0)} kr.",
                          style: AppTextStyles.pText,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
