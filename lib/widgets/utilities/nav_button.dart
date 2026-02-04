import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  final bool submit;
  final GlobalKey<FormState>? formKey;

  const NavButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.submit = false,
    this.formKey,
  });

  void _handleTap(BuildContext context) {
    if (submit) {
      final isValid = formKey?.currentState?.validate() ?? true;
      if (!isValid) return;
    }
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return Center(
      child: GestureDetector(
        onTap: isDisabled ? null : () => _handleTap(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 75), //  magic
          decoration: BoxDecoration(
            color: isDisabled
                ? AppColors.lightColor.withOpacity(0.8)
                : AppColors.primeColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDisabled ? 0.05 : 0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // 👈 important
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: isDisabled
                      ? AppColors.whiteColor
                      : AppColors.openingButtonTextColor,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(
                  color: isDisabled
                      ? AppColors.whiteColor
                      : AppColors.openingButtonTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.h3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
