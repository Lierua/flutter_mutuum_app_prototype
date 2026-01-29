import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class OptionButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primeColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(selected ? 0.15 : 0.1),
              blurRadius: selected ? 10 : 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.darkColor,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.h3,
          ),
        ),
      ),
    );
  }
}
