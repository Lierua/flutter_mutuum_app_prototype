import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';
import 'package:flutter_prototype/widgets/utilities/option_button.dart';

class SavingsStep2 extends StatelessWidget {
  final String savingsFor;
  final ValueChanged<String> onSavingsChanged;
  final VoidCallback? onNext;

  const SavingsStep2({
    super.key,
    required this.onNext,
    required this.savingsFor,
    required this.onSavingsChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 56),

          SizedBox(
            width: 330,
            child: Text(
              "Hvad vil du gerne spare op til?",
              style: AppTextStyles.pageTitle,
            ),
          ),

          SizedBox(height: AppSizes.spacing),

          // Scrollable options
          Expanded(
            child: ListView(
              children: [
                OptionButton(
                  label: "Ejerbolig",
                  selected: savingsFor == "Ejerbolig",
                  onTap: () => onSavingsChanged("Ejerbolig"),
                ),
                SizedBox(height: AppSizes.spacing),

                OptionButton(
                  label: "Andelsbolig",
                  selected: savingsFor == "Andelsbolig",
                  onTap: () => onSavingsChanged("Andelsbolig"),
                ),
                SizedBox(height: AppSizes.spacing),

                OptionButton(
                  label: "Fritidsbolig",
                  selected: savingsFor == "Fritidsbolig",
                  onTap: () => onSavingsChanged("Fritidsbolig"),
                ),
                SizedBox(height: AppSizes.spacing),

                OptionButton(
                  label: "Bil",
                  selected: savingsFor == "bil",
                  onTap: () => onSavingsChanged("bil"),
                ),
                SizedBox(height: AppSizes.spacing),

                OptionButton(
                  label: "Andet",
                  selected: savingsFor == "andet",
                  onTap: () => onSavingsChanged("andet"),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSizes.spacing),

          // Bottom button
          NavButton(label: "Forsæt", onPressed: onNext),

          SizedBox(height: AppSizes.spacing),
        ],
      ),
    );
  }
}
