import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilities/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilities/formWidgets/validators.dart';
import 'package:flutter_prototype/widgets/utilities/nav_button.dart';
import 'package:flutter_prototype/widgets/utilities/option_button.dart';

class SavingsStep3 extends StatefulWidget {
  final String savingsFor;
  final String savingsAmount;
  final String extraSaving;

  final ValueChanged<String> onSavingsChanged;
  final ValueChanged<String> onExtraSavingChanged;
  final VoidCallback? onNext;

  const SavingsStep3({
    super.key,
    required this.savingsAmount,
    required this.extraSaving,
    required this.onSavingsChanged,
    required this.onExtraSavingChanged,
    required this.savingsFor,
    required this.onNext,
  });

  @override
  State<SavingsStep3> createState() => _SavingsStep3State();
}

class _SavingsStep3State extends State<SavingsStep3> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _addSavingCtrl;

  @override
  void initState() {
    super.initState();
    _addSavingCtrl = TextEditingController(text: widget.savingsAmount);
  }

  @override
  void dispose() {
    _addSavingCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    widget.onSavingsChanged(_addSavingCtrl.text.trim());
    widget.onNext?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56),

            Text("Hvad vil du købe for?", style: AppTextStyles.pageTitle),
            SizedBox(height: AppSizes.spacing * 2),

            Text(
              "Indskriv det beløb du ønsker at købe for",
              style: AppTextStyles.pText,
            ),
            SizedBox(height: AppSizes.spacingInside),

            InputField(
              hintText: "kr.",
              controller: _addSavingCtrl,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              validator: AppValidators.savingAmountVal,
              onChanged: widget.onSavingsChanged,
            ),

            SizedBox(height: AppSizes.spacing * 2),
            if (widget.savingsFor == "Andelsbolig" ||
                widget.savingsFor == "Ejerbolig" ||
                widget.savingsFor == "Fritidsbolig")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skal du låne til boligforbedringer?",
                    style: AppTextStyles.overTitle,
                  ),
                  SizedBox(height: AppSizes.spacingInside / 2),

                  Text(
                    "Såsom nyt gulv, altan eller andet",
                    style: AppTextStyles.pText,
                  ),

                  SizedBox(height: AppSizes.spacing),

                  // Conditional section
                  Row(
                    children: [
                      Expanded(
                        child: OptionButton(
                          label: "Ja",
                          selected: widget.extraSaving == "ja",
                          onTap: () => widget.onExtraSavingChanged("ja"),
                        ),
                      ),

                      SizedBox(width: AppSizes.spacingInside),

                      Expanded(
                        child: OptionButton(
                          label: "Nej",
                          selected: widget.extraSaving == "nej",
                          onTap: () => widget.onExtraSavingChanged("nej"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const Spacer(),

            NavButton(
              label: "Forsæt",
              onPressed: widget.onNext == null ? null : _submit,
            ),

            const SizedBox(height: AppSizes.spacing),
          ],
        ),
      ),
    );
  }
}
