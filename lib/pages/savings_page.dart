import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/app-theme-variables.dart';

import '../widgets/homeWidgets/saving_widget.dart';
import '../widgets/savingWidgets/overview_widget.dart';

import '../widgets/savingWidgets/savingsSteps/savings_step1.dart';
import '../widgets/savingWidgets/savingsSteps/savings_step2.dart';
import '../widgets/savingWidgets/savingsSteps/savings_step3.dart';
import '../widgets/savingWidgets/savingsSteps/savings_step4.dart';
import '../widgets/savingWidgets/savingsSteps/savings_step5.dart';
import '../widgets/savingWidgets/savingsSteps/savings_step6.dart';
import '../widgets/savingWidgets/savingsSteps/savings_step7.dart';

import '../widgets/utilities/nav_button_second.dart';
import '../widgets/utilities/progress_bar.dart';

import 'data_page.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  final PageController _pageController = PageController();

  int _currentStep = 0;

  final int totalSteps = 7;

  // -----------------------------
  // Next step
  // -----------------------------
  void _nextStep(BorrowData data) {
    data.debugSaving();

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<BorrowData>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: _currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back, size: 35),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              )
            : null,
      ),

      body: Column(
        children: [
          /// Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),

              onPageChanged: (i) {
                setState(() => _currentStep = i);
              },

              children: [
                /// INTRO
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 56),

                      const SavingWidget(),

                      const SizedBox(height: AppSizes.spacing),

                      /// Overview now contains graph
                      const OverviewWidget(),

                      const SizedBox(height: AppSizes.spacing * 2),

                      Center(
                        child: Text(
                          "Sæt op din opsparingsplan her:",
                          style: AppTextStyles.sectionTitle,
                        ),
                      ),

                      const SizedBox(height: AppSizes.spacingInside),

                      NavButtonSecond(
                        label: "Sæt op",
                        onPressed: () => _nextStep(data),
                      ),

                      const SizedBox(height: AppSizes.spacing),
                    ],
                  ),
                ),

                /// Steps
                SavingsStep1(
                  savingWithMore: data.savingWithMore,
                  onSavingsChanged: data.setSavingWithMore,
                  onNext: data.savingWithMore.isEmpty
                      ? null
                      : () => _nextStep(data),
                ),

                SavingsStep2(
                  savingsFor: data.savingsFor,
                  onSavingsChanged: data.setSavingsFor,
                  onNext: data.savingsFor.isEmpty
                      ? null
                      : () => _nextStep(data),
                ),

                SavingsStep3(
                  savingsFor: data.savingsFor,
                  savingsAmount: data.savingsAmount,
                  extraSaving: data.extraSaving,
                  onSavingsChanged: data.setSavingsAmount,
                  onExtraSavingChanged: data.setExtraSaving,
                  onNext: data.savingsAmount.isEmpty
                      ? null
                      : () => _nextStep(data),
                ),

                SavingsStep4(
                  list: data.savings,
                  sum: data.savingsSum,
                  addSavings: data.addSavings,
                  addSavingsChanged: data.setAddSavings,
                  onToggle: data.toggleSavings,
                  onNext: () => _nextStep(data),
                ),

                SavingsStep5(
                  list: data.debts,
                  debtSum: data.debtSum,
                  addDebt: data.addDebt,
                  addDebtChanged: data.setAddDebt,
                  onToggle: data.toggleDebt,
                  onNext: () => _nextStep(data),
                ),

                SavingsStep6(
                  startDate: data.startDate,
                  amountPerMonth: data.amountPerMonth,
                  endDate: data.endDate,
                  savingsMonths: data.savingsMonths,
                  onStartChanged: data.setStartDate,
                  onEndChanged: data.setEndDate,
                  onNext: () => _nextStep(data),
                ),

                SavingsStep7(
                  savingsList: data.aktieAccount,
                  savingsMethod: data.savingsMethod,
                  onSavingsChanged: data.setSavingsMethod,
                  onToggle: data.toggleAktieAccount,
                  onNext: data.savingsMethod.isEmpty
                      ? null
                      : () => _nextStep(data),
                ),
              ],
            ),
          ),

          /// Progress bar
          if (_currentStep > 0)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ProgressBar(
                currentStep: (_currentStep - 1).clamp(0, totalSteps - 1),
                totalSteps: totalSteps,
              ),
            ),
        ],
      ),
    );
  }
}
