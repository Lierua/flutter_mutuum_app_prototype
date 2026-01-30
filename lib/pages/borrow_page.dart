import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step1.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step2.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step3.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step4.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step5.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step6.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step7.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step8.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/borrowSteps/borrow_step9.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/debt_list.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/summary_list.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button_second.dart';
import 'package:flutter_prototype/widgets/utilties/progress_bar.dart';

class BorrowPage extends StatefulWidget {
  const BorrowPage({super.key});

  @override
  State<BorrowPage> createState() => _BorrowPageState();
}

class _BorrowPageState extends State<BorrowPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  // Stored state
  String withPartner = "";
  String borrowFor = "";
  String housingFor = "";
  String knownAddress = "";
  String address = "";
  String country = "";
  String postalCode = "";
  String addSavings = "";
  String addDebt = "";

  // Debt list state
  final List<DebtItem> debts = [
    DebtItem(checked: false, title: "SU-gæld", amount: 40000),
    DebtItem(checked: false, title: "Banklån", amount: 10000),
  ];

  // Savings list state
  final List<DebtItem> savings = [
    DebtItem(checked: false, title: "Lønkonto", amount: 25000),
    DebtItem(checked: false, title: "Budget konto", amount: 8500),
    DebtItem(checked: false, title: "Opsparingskonto", amount: 10000),
  ];

  // Summary list state
  final List<SummaryItem> summaryList = [
    SummaryItem(title: "Lønkonto", amount: 25000),
    SummaryItem(title: "Budget konto", amount: 8500),
    SummaryItem(title: "Opsparingskonto", amount: 10000),
  ];

  // Helper to compute sum
  double _sum(List<DebtItem> list) {
    return list.where((d) => d.checked).fold(0.0, (sum, d) => sum + d.amount);
  }

  double get debtSum => _sum(debts);
  double get savingsSum => _sum(savings);

  void _toggleDebt(int index) {
    setState(() {
      debts[index].checked = !debts[index].checked;
    });
  }

  void _toggleSavings(int index) {
    setState(() {
      savings[index].checked = !savings[index].checked;
    });
  }

  final int totalSteps = 9;
  void _debugBorrowState() {
    debugPrint("──── BORROW STATE ────");
    debugPrint("withPartner: $withPartner");
    debugPrint("borrowFor: $borrowFor");
    debugPrint("housingFor: $housingFor");
    debugPrint("knownAddress: $knownAddress");
    debugPrint("postalCode: $postalCode");
    debugPrint("debtSum: ${debtSum.toStringAsFixed(0)}");
    debugPrint("savingsSum: ${savingsSum.toStringAsFixed(0)}");
    debugPrint("address: $address");
    debugPrint("country: $country");
    debugPrint("addSavings: $addSavings");
    debugPrint("addDebt: $addDebt");
    debugPrint("─────────────────────");
  }

  void _nextStep(int currentStep) {
    _debugBorrowState();

    // your existing logic below
    if (currentStep == 2 && (borrowFor == "bil" || borrowFor == "andet")) {
      _pageController.animateToPage(
        7,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    if (currentStep == 4 && knownAddress == "nej") {
      _pageController.animateToPage(
        6,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }
    if (currentStep == 5 && knownAddress == "ja") {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.topColor,

        leading: _currentStep > 0
            ? IconButton(
                icon: Icon(Icons.arrow_back, size: 35),
                onPressed: () {
                  // Step 7 (index 6)
                  if (_currentStep == 7 &&
                      (borrowFor == "bil" || borrowFor == "andet")) {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    return;
                  }
                  if (_currentStep == 7 &&
                      borrowFor == "bolig" &&
                      knownAddress == "ja") {
                    _pageController.animateToPage(
                      5,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    return;
                  }

                  // Step 6 (index 5)
                  if (_currentStep == 6 && knownAddress == "nej") {
                    _pageController.animateToPage(
                      4,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    return;
                  }

                  // Default behavior
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              )
            : null,

        title: _currentStep == 0
            ? Text("Lån", style: AppTextStyles.pageTitle)
            : null,
      ),

      body: Column(
        children: [
          /// Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() => _currentStep = index);
              },
              children: [
                /// INTRO
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 330,
                        child: Text(
                          "Hvad kan jeg låne for og hvad koster det?",
                          style: AppTextStyles.overTitle,
                        ),
                      ),

                      SizedBox(height: AppSizes.spacing),

                      DebtList(
                        list: debts,
                        sum: debtSum,
                        onToggle: _toggleDebt,
                        label: "Din nuværende gæld:",
                      ),

                      SizedBox(height: AppSizes.spacing * 2),

                      Text(
                        "Med vores låneberegner kan du nemt beregne de månedlige ydelser, så du får et klart billede af økonomien bag dit lån.",
                        style: AppTextStyles.pText,
                      ),

                      /// Go to BorrowStep1
                      Spacer(),
                      NavButtonSecond(
                        label: "Låneberegner",
                        onPressed: () => _nextStep(0),
                      ),
                      SizedBox(height: AppSizes.spacing),
                    ],
                  ),
                ),

                /// STEPS
                BorrowStep1(
                  withPartner: withPartner,
                  onBorrowChanged: (value) {
                    setState(() => withPartner = value);
                  },
                  onNext: withPartner == "" ? null : () => _nextStep(1),
                ),

                BorrowStep2(
                  borrowFor: borrowFor,
                  onBorrowChanged: (value) {
                    setState(() => borrowFor = value);
                  },
                  onNext: borrowFor == "" ? null : () => _nextStep(2),
                ),

                BorrowStep3(
                  housingFor: housingFor,
                  onBorrowChanged: (value) {
                    setState(() => housingFor = value);
                  },
                  onNext: housingFor == "" ? null : () => _nextStep(3),
                ),

                BorrowStep4(
                  knownAddress: knownAddress,
                  onBorrowChanged: (value) {
                    setState(() => knownAddress = value);
                  },
                  onNext: knownAddress == "" ? null : () => _nextStep(4),
                ),

                BorrowStep5(
                  address: address,
                  postalCode: postalCode,
                  country: country,
                  onAddressChanged: (v) => setState(() => address = v),
                  onPostalCodeChanged: (v) => setState(() => postalCode = v),
                  onCountryChanged: (v) => setState(() => country = v),
                  onNext: postalCode == "" && address == "" && country == ""
                      ? null
                      : () => _nextStep(5),
                ),
                BorrowStep6(
                  postalCode: postalCode,
                  onPostalCodeChanged: (value) {
                    setState(() => postalCode = value);
                  },
                  onNext: postalCode == "" ? null : () => _nextStep(6),
                ),

                BorrowStep7(
                  list: savings,
                  sum: savingsSum,
                  addSavings: addSavings,
                  addSavingsChanged: (v) => setState(() => addSavings = v),

                  onToggle: _toggleSavings,
                  onNext: () => _nextStep(7),
                ),

                BorrowStep8(
                  list: debts,
                  debtSum: debtSum,
                  addDebt: addDebt,
                  addSavingsChanged: (v) => setState(() => addSavings = v),

                  onToggle: _toggleDebt,
                  onNext: () => _nextStep(7),
                ),

                BorrowStep9(list: summaryList, onNext: () => _nextStep(7)),
              ],
            ),
          ),

          /// Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _currentStep > 0
                ? ProgressBar(
                    currentStep: (_currentStep - 1).clamp(0, totalSteps - 1),
                    totalSteps: totalSteps,
                  )
                : null,
          ),
          SizedBox(height: !(_currentStep > 0) ? AppSizes.spacingInside : null),
        ],
      ),
    );
  }
}
