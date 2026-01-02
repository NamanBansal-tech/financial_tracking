import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.suffix,
    this.lengthLimit = 50,
    this.digitsOnly = false,
    this.onTap,
    this.validator,
    this.enabled = true,
    this.isMandatoryField = false,
    this.readOnly = false,
  });

  final String labelText;
  final TextEditingController? controller;
  final int lengthLimit;
  final Widget? suffix;
  final String hintText;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final bool digitsOnly;
  final bool isMandatoryField;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      enabled: enabled,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffix,
        hintText: hintText,
      ),
      keyboardType:
          digitsOnly ? TextInputType.numberWithOptions(decimal: true) : null,
      inputFormatters: [
        if (digitsOnly)
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
        LengthLimitingTextInputFormatter(lengthLimit),
      ],
    );
  }
}
