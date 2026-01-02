import 'package:finance_tracking/utils/app_colors.dart';
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
    final bool disabled = isDisabled || isLoading;

    final Color backgroundColor = isSecondary
        ? Colors.white
        : AppColors.primary;

    final Color effectiveBg = disabled
        ? AppColors.buttonDisabledBg
        : backgroundColor;

    final Color textColor = isSecondary
        ? (disabled ? AppColors.buttonDisabledText : AppColors.primary)
        : Colors.white;

    return SizedBox(
      width: isExpanded ? context.width : width,
      height: 48.h, // consistent tap height across app
      child: Material(
        color: effectiveBg,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: disabled ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: Colors.white.withValues(alpha: 0.15),
          highlightColor: Colors.white.withValues(alpha: 0.05),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: isSecondary && !disabled
                  ? Border.all(
                      color: AppColors.primary.withValues(alpha: 0.6),
                      width: 1,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isSecondary ? AppColors.primary : Colors.white,
                        ),
                      ),
                    )
                  : Text(
                      label,
                      key: ValueKey(label),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        letterSpacing: 0.2,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
