import 'package:flutter/material.dart';

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
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        builder: (_) {
          return PopScope(
            canPop: isDismissible,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 36,
                left: 16,
                right: 16,
                top: topPadding ?? 36,
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
