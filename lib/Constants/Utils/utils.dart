import 'package:assignment_task/themes/Style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:assignment_task/Elements/Widgets/toast.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {

  static showSnackBar({required BuildContext context,required String value}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: MyColor.snackBarColor,
        content: Text(value,style: TextStyles.fieldTextStyle.copyWith(color: MyColor.white),),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static showToast(
      {required String value,
      Color? backgroundColor,
      Color? textColor,
      int? duration,
      String? imagePath,
      double? backgroundRadius,
      Border? border,
      bool? rootNavigator}) {
      Toast.show(
        value,
        backgroundColor: backgroundColor ?? Colors.black,
        duration: Toast.lengthShort,
        gravity: Toast.bottom,
        backgroundRadius: backgroundRadius ?? Sizes.RADIUS_20,
        border: border,
        rootNavigator: rootNavigator,
        textStyle:
            TextStyle(color: textColor ?? MyColor.white, fontSize: 18.sp),
      );
  }


}
