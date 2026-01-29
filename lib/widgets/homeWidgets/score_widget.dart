import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/circle_chart.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    //Chart variable
    double progressValue = 0.52;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP SECTION
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Din score:", style: AppTextStyles.pageTitle)),
            ],
          ),

          SizedBox(height: AppSizes.spacing),

          /// BOTTOM SECTION – CIRCLE CHART
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CustomPaint(
                    painter: CircleProgressPainter(
                      progress: progressValue,
                      color: progressColor,
                      strokeWidth: 20,
                    ),
                  ),
                ),
                Text(
                  "${(progressValue * 100).round()}%",
                  style: AppTextStyles.pageTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
