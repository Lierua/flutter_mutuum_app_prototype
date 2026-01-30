import 'package:flutter/material.dart';
import 'package:flutter_prototype/theme/app-theme-variables.dart';
import 'package:flutter_prototype/widgets/utilties/nav_button.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/inputfield.dart';
import 'package:flutter_prototype/widgets/utilties/formWidgets/validators.dart';

class BorrowStep5 extends StatefulWidget {
  final String address;
  final String postalCode;
  final String country;

  final ValueChanged<String> onAddressChanged;
  final ValueChanged<String> onPostalCodeChanged;
  final ValueChanged<String> onCountryChanged;

  final VoidCallback? onNext;

  const BorrowStep5({
    super.key,
    required this.address,
    required this.postalCode,
    required this.country,
    required this.onAddressChanged,
    required this.onPostalCodeChanged,
    required this.onCountryChanged,
    required this.onNext,
  });

  @override
  State<BorrowStep5> createState() => _BorrowStep5State();
}

class _BorrowStep5State extends State<BorrowStep5> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _addressCtrl;
  late final TextEditingController _postalCtrl;
  late final TextEditingController _countryCtrl;

  @override
  void initState() {
    super.initState();
    _addressCtrl = TextEditingController(text: widget.address);
    _postalCtrl = TextEditingController(text: widget.postalCode);
    _countryCtrl = TextEditingController(text: widget.country);
  }

  @override
  void dispose() {
    _addressCtrl.dispose();
    _postalCtrl.dispose();
    _countryCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;

    // Save to BorrowPage
    widget.onAddressChanged(_addressCtrl.text.trim());
    widget.onPostalCodeChanged(_postalCtrl.text.trim());
    widget.onCountryChanged(_countryCtrl.text.trim());

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
            SizedBox(height: AppSizes.spacing),

            Text("Adresse på ny bolig", style: AppTextStyles.pText),
            SizedBox(height: AppSizes.spacingInside),

            InputField(
              hintText: "Adresse",
              controller: _addressCtrl,
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
              validator: AppValidators.addressDK,
              onChanged: widget.onAddressChanged, // optional live update
            ),

            SizedBox(height: AppSizes.spacing),

            Text("Indskriv venligst postnummer", style: AppTextStyles.pText),
            SizedBox(height: AppSizes.spacingInside),

            InputField(
              hintText: "Postnummer",
              controller: _postalCtrl,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxLength: 4,
              validator: AppValidators.postalCodeDK,
              onChanged: widget.onPostalCodeChanged, // optional live update
            ),

            SizedBox(height: AppSizes.spacing),

            Text("Land", style: AppTextStyles.pText),
            SizedBox(height: AppSizes.spacingInside),

            InputField(
              hintText: "Land",
              controller: _countryCtrl,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              validator: AppValidators.countryDK,
              onChanged: widget.onCountryChanged, // optional live update
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
