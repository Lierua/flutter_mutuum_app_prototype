import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/debt_list.dart';
import 'package:flutter_prototype/widgets/utilities/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilities/formWidgets/validators.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';

class SavingsStep5 extends StatefulWidget {
  final List<DebtItem> list;
  final double debtSum;
  final String addDebt;

  final ValueChanged<int> onToggle;
  final ValueChanged<String> addDebtChanged;
  final VoidCallback onNext;

  const SavingsStep5({
    super.key,
    required this.list,
    required this.debtSum,
    required this.addDebt,
    required this.onToggle,
    required this.addDebtChanged,
    required this.onNext,
  });

  @override
  State<SavingsStep5> createState() => _SavingsStep5State();
}

class _SavingsStep5State extends State<SavingsStep5> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _addDebtCtrl;

  @override
  void initState() {
    super.initState();
    _addDebtCtrl = TextEditingController(text: widget.addDebt);
  }

  @override
  void dispose() {
    _addDebtCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    widget.addDebtChanged(_addDebtCtrl.text.trim());
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
                  SizedBox(height: 56),

                  Text(
                    "Forbind til din eksisterende gæld",
                    style: AppTextStyles.pageTitle,
                  ),

                  SizedBox(height: AppSizes.spacing),

                  DebtList(
                    list: widget.list,
                    sum: widget.debtSum,
                    onToggle: widget.onToggle,
                    label: "Vælg hvilke konti der skal indgå i din gæld",
                  ),

                  SizedBox(height: AppSizes.spacing),

                  Text("Supplerende gæld:", style: AppTextStyles.pText),
                  SizedBox(height: AppSizes.spacingInside),

                  InputField(
                    hintText: "Indtast supplerende gæld",
                    controller: _addDebtCtrl,
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
