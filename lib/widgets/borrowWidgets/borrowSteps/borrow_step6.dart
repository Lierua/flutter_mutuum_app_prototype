import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/validators.dart';

class BorrowStep6 extends StatefulWidget {
  final String postalCode;
  final ValueChanged<String> onPostalCodeChanged;
  final VoidCallback? onNext;

  const BorrowStep6({
    super.key,
    required this.postalCode,
    required this.onPostalCodeChanged,
    required this.onNext,
  });

  @override
  State<BorrowStep6> createState() => _BorrowStep6State();
}

class _BorrowStep6State extends State<BorrowStep6> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _postalCtrl;

  @override
  void initState() {
    super.initState();
    _postalCtrl = TextEditingController(text: widget.postalCode);
  }

  @override
  void dispose() {
    _postalCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;
    widget.onPostalCodeChanged(_postalCtrl.text.trim());
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
            Text(
              "Vælg område for din ønskede bolig",
              style: AppTextStyles.pageTitle,
            ),
            SizedBox(height: AppSizes.spacing * 2),

            Text("Indskriv venligst postnummer", style: AppTextStyles.pText),
            SizedBox(height: AppSizes.spacingInside),

            InputField(
              hintText: "Postnummer",
              controller: _postalCtrl,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              validator: AppValidators.postalCodeDK,
              onChanged: widget
                  .onPostalCodeChanged, // keeps BorrowPage updated live (optional)
            ),

            const Spacer(),

            NavButton(
              label: "Forsæt",
              onPressed: _submit, // validates before next
            ),
            const SizedBox(height: AppSizes.spacing),
          ],
        ),
      ),
    );
  }
}
