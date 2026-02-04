import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/debt_list.dart';
import 'package:flutter_prototype/widgets/utilities/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilities/formWidgets/validators.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';

class SavingsStep4 extends StatefulWidget {
  final List<DebtItem> list;
  final double sum;
  final String addSavings;

  final ValueChanged<int> onToggle;
  final ValueChanged<String> addSavingsChanged;
  final VoidCallback onNext;

  const SavingsStep4({
    super.key,
    required this.list,
    required this.sum,
    required this.addSavings,
    required this.onToggle,
    required this.addSavingsChanged,
    required this.onNext,
  });

  @override
  State<SavingsStep4> createState() => _SavingsStep4State();
}

class _SavingsStep4State extends State<SavingsStep4> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _addSavingCtrl;

  @override
  void initState() {
    super.initState();
    _addSavingCtrl = TextEditingController(text: widget.addSavings);
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
                  SizedBox(height: 56),

                  Text(
                    "Forbind til dine opsparingskonti",
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
