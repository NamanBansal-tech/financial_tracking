import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    this.validator,
    this.enabled = true,
    required this.hintText,
    this.isLoading = false,
    required this.labelText,
    this.isMandatoryField = false,
    required this.initialValue,
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
  final dynamic initialValue;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  dynamic selectedValue;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedValue = widget.initialValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      initialValue: widget.initialValue,
      validator: widget.validator,
      dropdownColor: Colors.white,
      items: widget.items,
      icon: widget.isLoading ? const SizedBox() : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: widget.labelText,
            style: TextStyle(color: Colors.black87),
            children: [
              if (widget.isMandatoryField)
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        hintText: widget.hintText,
        enabled: widget.enabled,
        suffixIcon:
            widget.isLoading
                ? const CircularProgressIndicator()
                : widget.suffix,
      ),
      onChanged: (val) {
        setState(() {
          selectedValue = val;
        });
      },
    );
  }
}
