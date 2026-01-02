import 'package:finance_tracking/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showSuccessToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.toastSuccessBg,
      textColor: AppColors.toastSuccessText,
    );
  }

  static void showErrorToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.toastErrorBg,
      textColor: AppColors.toastErrorText,
    );
  }

  static void showSimpleToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.toastInfoBg,
      textColor: AppColors.toastInfoText,
    );
  }
}
