import 'package:finance_tracking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonOptions extends StatelessWidget {
  const CommonOptions({
    super.key,
    required this.onEdit,
    this.showViewTransactions = true,
    this.onDelete,
    this.onView,
  });

  final bool showViewTransactions;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// 📊 View transactions
        if (showViewTransactions)
          _actionIcon(
            icon: Icons.show_chart_rounded,
            tooltip: 'View transactions',
            onTap: onView,
          ),

        /// ✏️ Edit
        _actionIcon(icon: Icons.edit, tooltip: 'Edit', onTap: onEdit),

        /// 🗑 Delete (destructive)
        _actionIcon(
          icon: Icons.delete_outline,
          tooltip: 'Delete',
          color: AppColors.expenseColor,
          onTap: onDelete,
        ),
      ],
    );
  }

  /// 🔹 Reusable action icon
  Widget _actionIcon({
    required IconData icon,
    required String tooltip,
    VoidCallback? onTap,
    Color? color,
  }) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(6.0.w),
          child: Icon(
            icon,
            size: 20.w,
            color: color ?? AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
