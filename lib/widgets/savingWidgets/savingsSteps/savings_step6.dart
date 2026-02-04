import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/savingWidgets/date_setting.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';

class SavingsStep6 extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  final int? savingsMonths;
  final double? amountPerMonth;

  final ValueChanged<DateTime> onStartChanged;
  final ValueChanged<DateTime> onEndChanged;

  final VoidCallback onNext;

  const SavingsStep6({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.savingsMonths,
    required this.onStartChanged,
    required this.onEndChanged,
    required this.amountPerMonth,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final hasValidPeriod = savingsMonths != null && savingsMonths! >= 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: ListView(
        children: [
          const SizedBox(height: 56),

          Text("Godkend opsparingsplan", style: AppTextStyles.pageTitle),

          SizedBox(height: AppSizes.spacing),

          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "De seneste 12 måneder har du i gennemsnit tjent ",
                  style: AppTextStyles.pText,
                ),
                TextSpan(
                  text: "14.300 kr ",
                  style: AppTextStyles.pText.copyWith(
                    color: AppColors.contrastColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: "hver måned", style: AppTextStyles.pText),
              ],
            ),
          ),

          SizedBox(height: AppSizes.spacingInside),

          Text(
            "Vælg de måneder du vil spare over (Vi anbefaler min. 2 måneder)",
            style: AppTextStyles.pText,
          ),

          SizedBox(height: AppSizes.spacing),

          DateSetting(
            startDate: startDate,
            endDate: endDate,
            onStartChanged: onStartChanged,
            onEndChanged: onEndChanged,
          ),

          SizedBox(height: AppSizes.spacing),

          if (savingsMonths != null)
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Mutuum anbefaler udfra dette at du sparer ",
                    style: AppTextStyles.pText,
                  ),
                  TextSpan(
                    text: "${amountPerMonth?.toStringAsFixed(0) ?? '-'} kr. ",
                    style: AppTextStyles.pText.copyWith(
                      color: AppColors.contrastColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: "op hver måned", style: AppTextStyles.pText),
                ],
              ),
            ),

          SizedBox(height: AppSizes.spacing * 3),

          // Bottom button
          NavButton(
            label: "Vælg Metode",
            onPressed: hasValidPeriod ? onNext : null,
          ),

          SizedBox(height: AppSizes.spacing),
        ],
      ),
    );
  }
}
