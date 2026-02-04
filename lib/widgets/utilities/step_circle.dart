import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class StepCircle extends StatelessWidget {
  final double progress; // 0.0 = empty, >0 = filled
  final double size;
  final double borderWidth;

  const StepCircle({
    super.key,
    required this.progress,
    this.size = 16,
    this.borderWidth = 2,
  });

  bool get isActive => progress > 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.darkColor : AppColors.lightColor,
          width: borderWidth,
        ),
      ),
      child: isActive
          ? Center(
              child: Container(
                width: size * 0.5,
                height: size * 0.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkColor,
                ),
              ),
            )
          : null,
    );
  }
}
