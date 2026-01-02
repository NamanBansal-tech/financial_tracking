import 'package:finance_tracking/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            horizontal: context.width / 9,
          ),
          child: const CircularProgressIndicator(),
        )
        : InkWell(
          onTap: isDisabled ? null : onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSecondary ? Colors.white : Colors.amber,
              borderRadius: BorderRadius.circular(16),
              border:
                  isSecondary && !isDisabled
                      ? Border.all(color: Colors.amberAccent, width: 1.w)
                      : null,
            ),
            width: isExpanded ? context.width : width,
            alignment: Alignment.center,
            foregroundDecoration:
                isDisabled
                    ? BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                    )
                    : null,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Text(
              label,
              style: TextStyle(
                color: isSecondary ? Colors.amber.shade600 : Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
        );
  }
}
