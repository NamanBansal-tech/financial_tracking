import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isDisabled = false,
    this.isSecondary = false,
    required this.label,
    required this.onTap,
    this.width,
    this.isLoading = false,
    this.isExpanded = false,
  });

  final void Function()? onTap;
  final bool isDisabled;
  final String label;
  final bool isSecondary;
  final bool isLoading;
  final double? width;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 9,
          ),
          child: const CircularProgressIndicator(color: Colors.amber),
        )
        : InkWell(
          onTap: isDisabled ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSecondary ? Colors.white : Colors.amber,
              borderRadius: BorderRadius.circular(16),
              border:
                  isSecondary && !isDisabled
                      ? Border.all(color: Colors.amberAccent, width: 1)
                      : null,
            ),
            width: isExpanded ? MediaQuery.of(context).size.width : width,
            alignment: Alignment.center,
            foregroundDecoration:
                isDisabled
                    ? BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                    )
                    : null,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              label,
              style: TextStyle(
                color: isSecondary ? Colors.amber.shade600 : Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        );
  }
}
