import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/debt_list.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';

class BorrowStep7 extends StatelessWidget {
  final List<DebtItem> list;
  final double sum;
  final ValueChanged<int> onToggle;
  final VoidCallback onNext;

  const BorrowStep7({
    super.key,
    required this.list,
    required this.sum,
    required this.onToggle,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: CustomScrollView(
        slivers: [
          /// Main content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forbind til eksisterende opsparingskonti",
                  style: AppTextStyles.pageTitle,
                ),

                SizedBox(height: AppSizes.spacing),

                DebtList(
                  list: list,
                  sum: sum,
                  onToggle: onToggle,
                  label:
                      "Vælg, hvilke konti der skal indgår i din opsparingsplan",
                ),
                SizedBox(height: AppSizes.spacing),

                Text("Supplerende opsparing:", style: AppTextStyles.pText),

                SizedBox(height: AppSizes.spacingInside),

                InputField(hintText: "Indtast supplerende opsparing"),
                SizedBox(height: AppSizes.spacing),
              ],
            ),
          ),

          /// Bottom button (sticks when short, scrolls when long)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Spacer(),
                NavButton(label: "Forsæt", onPressed: onNext),
                SizedBox(height: AppSizes.spacing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
