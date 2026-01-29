import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';
import 'package:flutter_prototype/widgets/utilties/option_button.dart';

class BorrowStep3 extends StatelessWidget {
  final String housingFor;
  final ValueChanged<String> onBorrowChanged;
  final VoidCallback? onNext;

  const BorrowStep3({
    super.key,
    required this.onNext,
    required this.housingFor,
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
              "Hvilken bolig vil du gerne låne til?",
              style: AppTextStyles.pageTitle,
            ),
          ),

          SizedBox(height: AppSizes.spacing),
          Spacer(),

          // Option buttons
          Column(
            children: [
              OptionButton(
                label: "Ejerbolig",
                selected: housingFor == "Ejerbolig",
                onTap: () => onBorrowChanged("Ejerbolig"),
              ),
              SizedBox(height: AppSizes.spacing * 1.5),
              OptionButton(
                label: "Andelsbolig",
                selected: housingFor == "Andelsbolig",
                onTap: () => onBorrowChanged("Andelsbolig"),
              ),
              SizedBox(height: AppSizes.spacing * 1.5),
              OptionButton(
                label: "Fritidsbolig",
                selected: housingFor == "Fritidsbolig",
                onTap: () => onBorrowChanged("Fritidsbolig"),
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
