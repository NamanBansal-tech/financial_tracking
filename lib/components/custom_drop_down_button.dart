import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    this.validator,
    this.enabled = true,
    required this.hintText,
    this.isLoading = false,
    required this.labelText,
    this.isMandatoryField = false,
    required this.selectedValue,
    this.suffix,
  });

  final List<DropdownMenuItem<Object>>? items;
  final String hintText;
  final bool isMandatoryField;
  final bool isLoading;
  final bool enabled;
  final String labelText;
  final Widget? suffix;
  final String? Function(Object?)? validator;
  final dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      validator: validator,
      dropdownColor: Colors.white,
      items: items,
      icon: isLoading ? const SizedBox() : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: labelText,
            style: TextStyle(
              color: Colors.black87,
            ),
            children: [
              if (isMandatoryField)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
        hintText: hintText,
        enabled: enabled,
        suffixIcon: isLoading ? const CircularProgressIndicator() : suffix,
      ),
      onChanged: (val) {},
    );
  }
}
