import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/circle_chart.dart';

class SavingWidget extends StatefulWidget {
  const SavingWidget({super.key});

  @override
  State<SavingWidget> createState() => _SavingWidgetState();
}

class _SavingWidgetState extends State<SavingWidget> {
  @override
  Widget build(BuildContext context) {
    //Chart variable
    double progressValue = 0.72;
    Color progressColor = AppColors.positiveColor;

    setState(() {
      final percent = progressValue * 100;

      if (percent < 33) {
        progressColor = AppColors.negativeColor;
      } else if (percent < 66) {
        progressColor = AppColors.neutralColor;
      } else {
        progressColor = AppColors.positiveColor;
      }
    });

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.boxPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadows.soft],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT SECTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    "Udbetaling til ejerbolig:",
                    style: AppTextStyles.sectionTitle,
                  ),
                ),

                SizedBox(height: AppSizes.boxPadding * 3),

                Row(
                  children: [
                    // green dot
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: progressColor,
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 8),

                    Text(
                      "72.000 / 100.000 kr",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// RIGHT SECTION – CIRCLE CHART
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: CustomPaint(
                  painter: CircleProgressPainter(
                    progress: progressValue,
                    color: progressColor,
                    strokeWidth: 12,
                  ),
                ),
              ),

              Text(
                "${(progressValue * 100).round()}%",
                style: AppTextStyles.sectionTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
