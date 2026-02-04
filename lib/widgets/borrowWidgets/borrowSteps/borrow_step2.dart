import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';
import 'package:flutter_prototype/widgets/utilities/option_button.dart';

class BorrowStep2 extends StatelessWidget {
  final String borrowFor;
  final ValueChanged<String> onBorrowChanged;
  final VoidCallback? onNext;

  const BorrowStep2({
    super.key,
    required this.onNext,
    required this.borrowFor,
    required this.onBorrowChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 330,
            child: Text(
              "Hvad vil du gerne låne til?",
              style: AppTextStyles.pageTitle,
            ),
          ),

          SizedBox(height: AppSizes.spacing),
          Spacer(),

          // Option buttons
          Column(
            children: [
              OptionButton(
                label: "Bolig",
                selected: borrowFor == "bolig",
                onTap: () => onBorrowChanged("bolig"),
              ),
              SizedBox(height: AppSizes.spacing * 1.5),
              OptionButton(
                label: "Bil",
                selected: borrowFor == "bil",
                onTap: () => onBorrowChanged("bil"),
              ),
              SizedBox(height: AppSizes.spacing * 1.5),
              OptionButton(
                label: "Andet",
                selected: borrowFor == "andet",
                onTap: () => onBorrowChanged("andet"),
              ),
            ],
          ),

          SizedBox(height: AppSizes.spacing * 2),
          Spacer(),

          NavButton(label: "Forsæt", onPressed: onNext),
          SizedBox(height: AppSizes.spacing),
        ],
      ),
    );
  }
}
