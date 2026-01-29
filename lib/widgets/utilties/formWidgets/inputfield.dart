import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.textInputAction,
    this.maxLength,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: controller?.text, // 👈 sync form state
      validator: validator,
      builder: (field) {
        final hasError = field.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: hasError ? Colors.red : AppColors.lightColor,
                  width: 2,
                ),
              ),
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                maxLength: maxLength,
                onChanged: (value) {
                  field.didChange(value);
                  onChanged?.call(value);
                },
                style: const TextStyle(color: AppColors.darkColor),
                decoration: InputDecoration(
                  hintText: hintText,
                  filled: true,
                  fillColor: AppColors.lightColor.withOpacity(0.2),
                  border: InputBorder.none,
                  counterText: "",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
            if (hasError) ...[
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  field.errorText ?? "",
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
