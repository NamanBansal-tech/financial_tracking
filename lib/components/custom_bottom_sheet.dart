import 'package:finance_tracking/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customBottomSheet({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool enableDrag = true,
  double? topPadding,
  Function(dynamic)? onSuccess,
  Function()? onComplete,
  Function(Object, StackTrace)? onError,
}) {
  showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        showDragHandle: enableDrag,
        backgroundColor: Colors.white,
        constraints: BoxConstraints(
          maxHeight: context.height * 0.7,
        ),
        builder: (_) {
          return PopScope(
            canPop: isDismissible,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 36.h,
                left: 16.w,
                right: 16.w,
                top: topPadding ?? 36.h,
              ),
              child: child,
            ),
          );
        },
      )
      .whenComplete(onComplete ?? () {})
      .then(onSuccess ?? (_) {})
      .onError(onError ?? (_, _) {});
}
