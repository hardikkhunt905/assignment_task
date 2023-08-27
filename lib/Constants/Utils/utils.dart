import 'package:assignment_task/themes/Style/text_styles.dart';
import 'package:flutter/material.dart';
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


}
