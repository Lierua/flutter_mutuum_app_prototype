import 'package:flutter/material.dart';
import 'package:flutter_prototype/pages/main_page.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/savingWidgets/savings_list.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';
import 'package:flutter_prototype/widgets/utilities/navigation_provider.dart';
import 'package:flutter_prototype/widgets/utilities/option_button.dart';
import 'package:provider/provider.dart';

class SavingsStep7 extends StatelessWidget {
  final String savingsMethod;
  final List<AccountItem> savingsList;

  final ValueChanged<String> onSavingsChanged;
  final ValueChanged<int> onToggle;

  final VoidCallback? onNext;

  const SavingsStep7({
    super.key,
    required this.savingsMethod,
    required this.savingsList,
    required this.onSavingsChanged,
    required this.onToggle,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final showAccounts = savingsMethod == "Forbind";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Scrollable content
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 56),

                Text("Vælg opsparingsmetode", style: AppTextStyles.pageTitle),

                const SizedBox(height: AppSizes.spacing * 3),

                // Option buttons
                OptionButton(
                  label: "Anmod om aktiesparekonto",
                  selected: savingsMethod == "Anmod",
                  onTap: () => onSavingsChanged("Anmod"),
                ),

                const SizedBox(height: AppSizes.spacingInside),

                OptionButton(
                  label: "Forbind eksisterende aktiekonto",
                  selected: savingsMethod == "Forbind",
                  onTap: () => onSavingsChanged("Forbind"),
                ),

                const SizedBox(height: AppSizes.spacing * 2),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    final slideIn = Tween<Offset>(
                      begin: const Offset(0, 0.15), // from bottom
                      end: Offset.zero,
                    ).animate(animation);

                    final slideOut = Tween<Offset>(
                      begin: Offset.zero,
                      end: const Offset(0, -0.15), // to top
                    ).animate(animation);

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: animation.status == AnimationStatus.reverse
                            ? slideOut
                            : slideIn,
                        child: child,
                      ),
                    );
                  },
                  child: savingsMethod == "Anmod"
                      ? _AnmodSection()
                      : savingsMethod == "Forbind"
                      ? _ForbindSection(list: savingsList, onToggle: onToggle)
                      : const SizedBox(),
                ),

                const SizedBox(height: AppSizes.spacing * 2),
              ],
            ),
          ),

          // Bottom button
          NavButton(
            label: "Godkend din plan",
            onPressed: () {
              context.read<NavigationProvider>().setIndex(0);
            },
          ),

          const SizedBox(height: AppSizes.spacing),
        ],
      ),
    );
  }
}

class _AnmodSection extends StatelessWidget {
  const _AnmodSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("anmod"), // important!
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Forventet indskud", style: AppTextStyles.pText),

        SizedBox(height: AppSizes.spacingInside),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.boxPadding),
          child: Text(
            "15.000 kr.",
            style: AppTextStyles.overTitle.copyWith(
              color: AppColors.darkColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: AppSizes.spacing),
      ],
    );
  }
}

class _ForbindSection extends StatelessWidget {
  final List<AccountItem> list;
  final ValueChanged<int> onToggle;

  const _ForbindSection({required this.list, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("forbind"), // important!
      children: [
        SavingsList(list: list, label: "Mulige aktiekonti", onToggle: onToggle),
      ],
    );
  }
}
