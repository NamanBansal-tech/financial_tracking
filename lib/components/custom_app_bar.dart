import 'package:flutter/material.dart';
import 'package:finance_tracking/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.showBack = true,
  });

  final String title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary, // amber
      elevation: 0, // clean, modern
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBack,

      // 🔹 Title
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: AppColors.textPrimary, // dark on amber
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),

      // 🔹 Icons (back + actions)
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: 22,
      ),

      actionsIconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: 22,
      ),

      // 🔹 Actions
      actions: actions
          ?.map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 4),
              child: e,
            ),
          )
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
