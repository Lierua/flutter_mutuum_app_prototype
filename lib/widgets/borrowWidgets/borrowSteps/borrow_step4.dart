import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';
import 'package:flutter_prototype/widgets/utilties/option_button.dart';

class BorrowStep4 extends StatelessWidget {
  final String knownAddress;
  final ValueChanged<String> onBorrowChanged;
  final VoidCallback? onNext;

  const BorrowStep4({
    super.key,
    required this.knownAddress,
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
          Text(
            "Kender du adressen på din nye bolig",
            style: AppTextStyles.pageTitle,
          ),

          Spacer(),

          //Option buttons
          OptionButton(
            label: "Ja",
            selected: knownAddress == "ja",
            onTap: () => onBorrowChanged("ja"),
          ),

          const SizedBox(height: AppSizes.spacing * 1.5),

          OptionButton(
            label: "Nej",
            selected: knownAddress == "nej",
            onTap: () => onBorrowChanged("nej"),
          ),

          const Spacer(),

          NavButton(label: "Forsæt", onPressed: onNext),
          const SizedBox(height: AppSizes.spacing),
        ],
      ),
    );
  }
}
