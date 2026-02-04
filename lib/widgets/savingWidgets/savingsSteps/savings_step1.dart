import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';
import 'package:flutter_prototype/widgets/utilities/option_button.dart';

class SavingsStep1 extends StatelessWidget {
  final String savingWithMore;
  final ValueChanged<String> onSavingsChanged;
  final VoidCallback? onNext;

  const SavingsStep1({
    super.key,
    required this.savingWithMore,
    required this.onSavingsChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 56),

          Text("Vil du spare op med flere?", style: AppTextStyles.pageTitle),

          const SizedBox(height: AppSizes.spacing * 4),

          //Option buttons
          OptionButton(
            label: "Ja",
            selected: savingWithMore == "ja",
            onTap: () => onSavingsChanged("ja"),
          ),

          const SizedBox(height: AppSizes.spacing * 1.5),

          OptionButton(
            label: "Nej",
            selected: savingWithMore == "nej",
            onTap: () => onSavingsChanged("nej"),
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
