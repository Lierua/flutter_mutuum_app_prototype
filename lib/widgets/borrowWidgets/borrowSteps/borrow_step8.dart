import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/debt_list.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/validators.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';

class BorrowStep8 extends StatefulWidget {
  final List<DebtItem> list;
  final double debtSum;
  final String addDebt;
  final ValueChanged<int> onToggle;
  final ValueChanged<String> addSavingsChanged;
  final VoidCallback onNext;

  const BorrowStep8({
    super.key,
    required this.list,
    required this.debtSum,
    required this.addDebt,
    required this.onToggle,
    required this.addSavingsChanged,
    required this.onNext,
  });

  @override
  State<BorrowStep8> createState() => _BorrowStep8State();
}

class _BorrowStep8State extends State<BorrowStep8> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _addSavingCtrl;

  @override
  void initState() {
    super.initState();
    _addSavingCtrl = TextEditingController(text: widget.addDebt.toString());
  }

  @override
  void dispose() {
    _addSavingCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    widget.addSavingsChanged(_addSavingCtrl.text.trim());

    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            /// Main content
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forbind til eksisterende gældskonti",
                    style: AppTextStyles.pageTitle,
                  ),

                  SizedBox(height: AppSizes.spacing),

                  DebtList(
                    list: widget.list,
                    sum: widget.debtSum,
                    onToggle: widget.onToggle,
                    label: "Vælg hvilke konti der skal indgå i din gældskonti",
                  ),

                  SizedBox(height: AppSizes.spacing),

                  Text("Supplerende gæld:", style: AppTextStyles.pText),
                  SizedBox(height: AppSizes.spacingInside),

                  InputField(
                    hintText: "Indtast supplerende gæld",
                    controller: _addSavingCtrl,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    validator: AppValidators.addDebtVal,
                  ),

                  SizedBox(height: AppSizes.spacing),
                ],
              ),
            ),

            /// Bottom button
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  NavButton(label: "Forsæt", onPressed: _submit),
                  SizedBox(height: AppSizes.spacing),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
