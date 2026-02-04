import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/circle_chart.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button_second.dart';
import 'package:flutter_prototype/widgets/utilities/navigation_provider.dart';
import 'package:provider/provider.dart';

class SavingWidget extends StatefulWidget {
  const SavingWidget({super.key});

  @override
  State<SavingWidget> createState() => _SavingWidgetState();
}

class _SavingWidgetState extends State<SavingWidget> {
  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Opsparingsplan", style: AppTextStyles.pageTitle),
          SizedBox(height: AppSizes.spacingInside),
          SizedBox(
            width: 220,
            child: Text("Sat købs beløb", style: AppTextStyles.sectionTitle),
          ),
          Text("1.200.000 kr.", style: AppTextStyles.pageTitle),
          SizedBox(height: AppSizes.spacing * 1.5),
          Row(
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
                        "Total Udbetaling til Indskud:",
                        style: AppTextStyles.sectionTitle,
                      ),
                    ),

                    SizedBox(height: AppSizes.boxPadding * 2.5),

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
                            fontSize: 18,
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
          // Only show if NOT on borrow tab
          if (nav.index != 2)
            Column(
              children: [
                SizedBox(height: AppSizes.spacing),
                NavButtonSecond(
                  label: "Opsparingsplan",
                  icon: Icons.balance,
                  onPressed: () {
                    context.read<NavigationProvider>().setIndex(2);
                  },
                ),
              ],
            ),

          if (nav.index == 2)
            Column(
              children: [
                SizedBox(height: AppSizes.spacing),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.contrastColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.balance,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
