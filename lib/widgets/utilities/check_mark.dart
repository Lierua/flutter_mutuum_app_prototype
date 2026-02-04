import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CircleCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: value ? AppColors.darkColor : AppColors.lightColor,
            width: 2,
          ),
          color: value ? Colors.transparent : Colors.transparent,
        ),
        child: value
            ? const Icon(Icons.circle, size: 10, color: AppColors.darkColor)
            : null,
      ),
    );
  }
}
