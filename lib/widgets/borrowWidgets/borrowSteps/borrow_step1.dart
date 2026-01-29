import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';
import 'package:flutter_prototype/widgets/utilties/option_button.dart';

class BorrowStep1 extends StatelessWidget {
  final String withPartner;
  final ValueChanged<String> onBorrowChanged;
  final VoidCallback? onNext;

  const BorrowStep1({
    super.key,
    required this.withPartner,
    required this.onBorrowChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skal du låne med en partner?", style: AppTextStyles.pageTitle),

          Spacer(),

          //Option buttons
          OptionButton(
            label: "Ja",
            selected: withPartner == "ja",
            onTap: () => onBorrowChanged("ja"),
          ),

          const SizedBox(height: AppSizes.spacing * 1.5),

          OptionButton(
            label: "Nej",
            selected: withPartner == "nej",
            onTap: () => onBorrowChanged("nej"),
          ),

          SizedBox(height: AppSizes.spacing),

          const Spacer(),

          NavButton(label: "Forsæt", onPressed: onNext),
          const SizedBox(height: AppSizes.spacing),
        ],
      ),
    );
  }
}
