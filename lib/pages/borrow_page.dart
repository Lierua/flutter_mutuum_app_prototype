import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/app-theme-variables.dart';

import '../widgets/homeWidgets/borrow_widget.dart';

import '../widgets/borrowWidgets/borrowSteps/borrow_step1.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step2.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step3.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step4.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step5.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step6.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step7.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step8.dart';
import '../widgets/borrowWidgets/borrowSteps/borrow_step9.dart';

import '../widgets/utilities/nav_button_second.dart';
import '../widgets/utilities/progress_bar.dart';

import 'data_page.dart';

class BorrowPage extends StatefulWidget {
  const BorrowPage({super.key});

  @override
  State<BorrowPage> createState() => _BorrowPageState();
}

class _BorrowPageState extends State<BorrowPage> {
  final PageController _pageController = PageController();

  int _currentStep = 0;

  final int totalSteps = 9;

  void _nextStep(int currentStep, BorrowData data) {
    data.debugBorrow();

    if (currentStep == 2 &&
        (data.borrowFor == "bil" || data.borrowFor == "andet")) {
      _pageController.animateToPage(
        7,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    if (currentStep == 4 && data.knownAddress == "nej") {
      _pageController.animateToPage(
        6,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    if (currentStep == 5 && data.knownAddress == "ja") {
      _pageController.animateToPage(
        7,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

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

      appBar: AppBar(
        backgroundColor: AppColors.topColor,

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BorrowWidget(),

                      SizedBox(height: AppSizes.spacing),

                      Text(
                        "Med vores låneberegner kan du nemt indhente lånetilbud",
                        style: AppTextStyles.pText,
                      ),

                      const Spacer(),

                      Center(
                        child: Text(
                          "Beregn dit her og nu:",
                          style: AppTextStyles.sectionTitle,
                        ),
                      ),

                      SizedBox(height: AppSizes.spacingInside),

                      NavButtonSecond(
                        label: "Indhent lånetilbud",
                        onPressed: () => _nextStep(0, data),
                      ),

                      SizedBox(height: AppSizes.spacing),
                    ],
                  ),
                ),

                BorrowStep1(
                  withPartner: data.withPartner,
                  onBorrowChanged: data.setWithPartner,
                  onNext: data.withPartner.isEmpty
                      ? null
                      : () => _nextStep(1, data),
                ),

                BorrowStep2(
                  borrowFor: data.borrowFor,
                  onBorrowChanged: data.setBorrowFor,
                  onNext: data.borrowFor.isEmpty
                      ? null
                      : () => _nextStep(2, data),
                ),

                BorrowStep3(
                  housingFor: data.housingFor,
                  onBorrowChanged: data.setHousingFor,
                  onNext: data.housingFor.isEmpty
                      ? null
                      : () => _nextStep(3, data),
                ),

                BorrowStep4(
                  knownAddress: data.knownAddress,
                  onBorrowChanged: data.setKnownAddress,
                  onNext: data.knownAddress.isEmpty
                      ? null
                      : () => _nextStep(4, data),
                ),

                BorrowStep5(
                  address: data.address,
                  postalCode: data.postalCode,
                  country: data.country,
                  onAddressChanged: data.setAddress,
                  onPostalCodeChanged: data.setPostalCode,
                  onCountryChanged: data.setCountry,
                  onNext:
                      (data.address.isEmpty ||
                          data.postalCode.isEmpty ||
                          data.country.isEmpty)
                      ? null
                      : () => _nextStep(5, data),
                ),

                BorrowStep6(
                  postalCode: data.postalCode,
                  onPostalCodeChanged: data.setPostalCode,
                  onNext: data.postalCode.isEmpty
                      ? null
                      : () => _nextStep(6, data),
                ),

                BorrowStep7(
                  list: data.savings,
                  sum: data.savingsSum,
                  addSavings: data.addSavings,
                  addSavingsChanged: data.setAddSavings,
                  onToggle: data.toggleSavings,
                  onNext: () => _nextStep(7, data),
                ),

                BorrowStep8(
                  list: data.debts,
                  debtSum: data.debtSum,
                  addDebt: data.addDebt,
                  addSavingsChanged: data.setAddDebt,
                  onToggle: data.toggleDebt,
                  onNext: () => _nextStep(8, data),
                ),

                BorrowStep9(
                  list: data.summary,
                  onNext: () => _nextStep(9, data),
                ),
              ],
            ),
          ),

          /// Progress
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _currentStep > 0
                ? ProgressBar(
                    currentStep: (_currentStep - 1).clamp(0, totalSteps - 1),
                    totalSteps: totalSteps,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
