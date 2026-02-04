import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/savingWidgets/savings_bar_graph.dart';

import '../../pages/data_page.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  // -----------------------------
  // Progress color helper
  // -----------------------------
  Color _getProgressColor(double percent) {
    if (percent < 33) return AppColors.negativeColor;
    if (percent < 66) return AppColors.neutralColor;
    if (percent < 100) return AppColors.positiveColor;

    return AppColors.reachedColor;
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<BorrowData>();

    // Safe values
    final double? monthlyAmount = data.amountPerMonth;
    final List<double> graphData = data.savingsGraphList
        .map((e) => e.toDouble())
        .toList();

    final bool hasSavingsData =
        monthlyAmount != null && monthlyAmount > 0 && graphData.isNotEmpty;

    // Example progress (placeholder for now)
    final double progressValue = hasSavingsData ? 0.45 : 0.0;
    final double percent = progressValue * 100;
    final Color progressColor = _getProgressColor(percent);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.boxPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadows.soft],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text("Ydre Oversigt", style: AppTextStyles.pageTitle),

          const SizedBox(height: AppSizes.spacingInside),

          Text("Status for denne måned", style: AppTextStyles.sectionTitle),

          const SizedBox(height: AppSizes.spacingInside),

          // Status row
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: progressColor,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 14),

              Text(
                hasSavingsData
                    ? "600 / ${monthlyAmount!.toStringAsFixed(0)} kr"
                    : "Ingen data endnu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightColor.withOpacity(0.8),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.spacing * 1.5),

          Text("Forløbs oversigt", style: AppTextStyles.sectionTitle),

          const SizedBox(height: AppSizes.spacingInside),

          // -------- Savings graph --------
          if (hasSavingsData)
            SavingsBarGraph(
              monthlySavings: graphData,
              goalAmount: monthlyAmount!,
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Udfyld opsparingsplanen for at se grafen",
                style: AppTextStyles.pText.copyWith(
                  color: AppColors.lightColor,
                ),
              ),
            ),
          const SizedBox(height: AppSizes.spacingInside),
        ],
      ),
    );
  }
}
