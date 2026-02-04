import 'package:flutter/material.dart';
import 'package:flutter_prototype/widgets/utilities/step_circle.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        double progress;

        if (index < currentStep) {
          progress = 1.0; // completed
        } else if (index == currentStep) {
          progress = 0.6; // active
        } else {
          progress = 0.0; // upcoming
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: StepCircle(progress: progress),
        );
      }),
    );
  }
}
