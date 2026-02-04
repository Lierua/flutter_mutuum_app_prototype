import 'package:flutter/foundation.dart';

import '../widgets/utilities/debt_list.dart';
import '../widgets/borrowWidgets/summary_list.dart';
import '../widgets/savingWidgets/savings_list.dart';

class BorrowData extends ChangeNotifier {
  // ==================================================
  // BORROW SECTION
  // ==================================================

  String withPartner = "";
  String borrowFor = "";
  String housingFor = "";
  String knownAddress = "";
  String address = "";
  String country = "";
  String postalCode = "";

  String addSavings = "";
  String addDebt = "";

  // ==================================================
  // SAVINGS SECTION
  // ==================================================

  String savingWithMore = "";
  String savingsFor = "";
  String savingsAmount = "";
  String extraSaving = "";

  DateTime? startDate;
  DateTime? endDate;

  String savingsMethod = "";

  int? savingsMonths;
  double? amountPerMonth;

  // Demo savings list for graph
  List<int> get savingsGraphList {
    if (savingsMonths == null || savingsMonths! <= 0) {
      return [];
    }

    return List.generate(savingsMonths!, (_) => 1500);
  }

  // ==================================================
  // SHARED LISTS
  // ==================================================

  final List<DebtItem> debts = [
    DebtItem(checked: false, title: "SU-gæld", amount: 40000),
    DebtItem(checked: false, title: "Banklån", amount: 10000),
  ];

  final List<DebtItem> savings = [
    DebtItem(checked: false, title: "Lønkonto", amount: 25000),
    DebtItem(checked: false, title: "Budget konto", amount: 8500),
    DebtItem(checked: false, title: "Opsparingskonto", amount: 10000),
  ];

  final List<SummaryItem> summary = [
    SummaryItem(title: "Lønkonto", amount: 25000),
    SummaryItem(title: "Budget konto", amount: 8500),
    SummaryItem(title: "Opsparingskonto", amount: 10000),
  ];

  final List<AccountItem> aktieAccount = [
    AccountItem(checked: false, title: "Saxo", amount: 25000),
    AccountItem(checked: false, title: "Nordnet", amount: 8500),
  ];

  // ==================================================
  // COMPUTED VALUES
  // ==================================================

  double get debtSum =>
      debts.where((d) => d.checked).fold(0.0, (s, d) => s + d.amount);

  double get savingsSum =>
      savings.where((d) => d.checked).fold(0.0, (s, d) => s + d.amount);

  // ==================================================
  // BORROW SETTERS
  // ==================================================

  void setWithPartner(String v) {
    withPartner = v;
    notifyListeners();
  }

  void setBorrowFor(String v) {
    borrowFor = v;
    notifyListeners();
  }

  void setHousingFor(String v) {
    housingFor = v;
    notifyListeners();
  }

  void setKnownAddress(String v) {
    knownAddress = v;
    notifyListeners();
  }

  void setAddress(String v) {
    address = v;
    notifyListeners();
  }

  void setPostalCode(String v) {
    postalCode = v;
    notifyListeners();
  }

  void setCountry(String v) {
    country = v;
    notifyListeners();
  }

  void setAddSavings(String v) {
    addSavings = v;
    notifyListeners();
  }

  void setAddDebt(String v) {
    addDebt = v;
    notifyListeners();
  }

  // ==================================================
  // SAVINGS SETTERS
  // ==================================================

  void setSavingWithMore(String v) {
    savingWithMore = v;
    notifyListeners();
  }

  void setSavingsFor(String v) {
    savingsFor = v;
    notifyListeners();
  }

  void setSavingsAmount(String v) {
    savingsAmount = v;
    notifyListeners();
  }

  void setExtraSaving(String v) {
    extraSaving = v;
    notifyListeners();
  }

  void setSavingsMethod(String v) {
    savingsMethod = v;
    notifyListeners();
  }

  // ==================================================
  // DATE + CALCULATION LOGIC
  // ==================================================

  void setStartDate(DateTime d) {
    startDate = d;
    _recalculateSavingsPeriod();
  }

  void setEndDate(DateTime d) {
    endDate = d;
    _recalculateSavingsPeriod();
  }

  void _recalculateSavingsPeriod() {
    if (startDate == null || endDate == null) {
      savingsMonths = null;
      amountPerMonth = null;
      notifyListeners();
      return;
    }

    final months =
        (endDate!.year - startDate!.year) * 12 +
        (endDate!.month - startDate!.month) +
        1;

    if (months <= 0) {
      savingsMonths = null;
      amountPerMonth = null;
    } else {
      savingsMonths = months;
      amountPerMonth = 14300 / months;
    }

    notifyListeners();
  }

  // ==================================================
  // LIST TOGGLES
  // ==================================================

  void toggleDebt(int i) {
    debts[i].checked = !debts[i].checked;
    notifyListeners();
  }

  void toggleSavings(int i) {
    savings[i].checked = !savings[i].checked;
    notifyListeners();
  }

  void toggleAktieAccount(int i) {
    aktieAccount[i].checked = !aktieAccount[i].checked;
    notifyListeners();
  }

  // ==================================================
  // DEBUG
  // ==================================================

  void debugBorrow() {
    debugPrint("──── BORROW DATA ────");

    debugPrint("withPartner   : $withPartner");
    debugPrint("borrowFor     : $borrowFor");
    debugPrint("housingFor    : $housingFor");
    debugPrint("knownAddress  : $knownAddress");
    debugPrint("postalCode    : $postalCode");

    debugPrint("debtSum       : $debtSum");
    debugPrint("savingsSum    : $savingsSum");

    debugPrint("addSavings    : $addSavings");
    debugPrint("addDebt       : $addDebt");

    debugPrint("────────────────────");
  }

  void debugSaving() {
    debugPrint("──── SAVINGS DATA ────");

    debugPrint("savingWithMore : $savingWithMore");
    debugPrint("savingsFor     : $savingsFor");
    debugPrint("savingsMethod  : $savingsMethod");

    debugPrint("savingsAmount  : $savingsAmount");
    debugPrint("extraSaving    : $extraSaving");

    debugPrint("startDate      : $startDate");
    debugPrint("endDate        : $endDate");

    debugPrint("savingsMonths  : $savingsMonths");
    debugPrint("amountPerMonth       : $amountPerMonth");

    debugPrint("addSavings     : $addSavings");
    debugPrint("addDebt        : $addDebt");

    debugPrint("────────────────────");
  }

  // ==================================================
  // RESET
  // ==================================================

  void clearAll() {
    // Borrow
    withPartner = "";
    borrowFor = "";
    housingFor = "";
    knownAddress = "";
    address = "";
    country = "";
    postalCode = "";
    addSavings = "";
    addDebt = "";

    // Savings
    savingWithMore = "";
    savingsFor = "";
    savingsAmount = "";
    extraSaving = "";
    savingsMethod = "";

    startDate = null;
    endDate = null;
    savingsMonths = null;
    amountPerMonth = null;

    // Lists
    for (final d in debts) {
      d.checked = false;
    }

    for (final s in savings) {
      s.checked = false;
    }

    for (final a in aktieAccount) {
      a.checked = false;
    }

    notifyListeners();
  }
}
