import 'package:finance_tracking/components/custom_button.dart';
import 'package:flutter/material.dart';

Future<dynamic> deleteDialogBox({
  required BuildContext context,
  required String title,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  label: "Delete",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  label: "Cancel",
                  isSecondary: true,
                ),
              ),
            ],
          ),
          scrollable: true,
          title: Text(title, style: TextStyle(fontSize: 18)),
        ),
      );
    },
  );
}
