import 'package:flutter/material.dart';
import 'package:bloc_base_structure/Elements/Widgets/custom_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTitle extends StatelessWidget {

  final String title;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;

  const CustomTitle({Key? key,required this.title, this.fontSize,this.fontColor,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tempSize = fontSize ?? 12.sp;

    return Text(title,
              style: CustomStyles.textStyle(
                  fontSize: tempSize,
                  fontColor: fontColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.bold
              )
              //TextStyle(color: uiColors.title, fontSize:  animate ?? false ? size.value : tempsize),
              );
  }
}
