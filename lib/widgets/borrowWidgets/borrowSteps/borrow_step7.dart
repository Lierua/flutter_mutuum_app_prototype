import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/borrowWidgets/debt_list.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/validators.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';

class BorrowStep7 extends StatefulWidget {
  final List<DebtItem> list;
  final double sum;
  final String addSavings;
  final ValueChanged<int> onToggle;
  final ValueChanged<String> addSavingsChanged;
  final VoidCallback onNext;

  const BorrowStep7({
    super.key,
    required this.list,
    required this.sum,
    required this.addSavings,
    required this.onToggle,
    required this.addSavingsChanged,
    required this.onNext,
  });

  @override
  State<BorrowStep7> createState() => _BorrowStep7State();
}

class _BorrowStep7State extends State<BorrowStep7> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _addSavingCtrl;

  @override
  void initState() {
    super.initState();
    _addSavingCtrl = TextEditingController(text: widget.addSavings.toString());
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
                    "Forbind til eksisterende opsparingskonti",
                    style: AppTextStyles.pageTitle,
                  ),

                  SizedBox(height: AppSizes.spacing),

                  DebtList(
                    list: widget.list,
                    sum: widget.sum,
                    onToggle: widget.onToggle,
                    label:
                        "Vælg hvilke konti der skal indgå i din opsparingsplan",
                  ),

                  SizedBox(height: AppSizes.spacing),

                  Text("Supplerende opsparing:", style: AppTextStyles.pText),
                  SizedBox(height: AppSizes.spacingInside),

                  InputField(
                    hintText: "Indtast supplerende opsparing",
                    controller: _addSavingCtrl,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    validator: AppValidators.addSavingVal,
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
