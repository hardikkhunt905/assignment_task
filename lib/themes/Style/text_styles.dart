import 'package:flutter/material.dart';
import 'package:bloc_base_structure/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/constants.dart';

class TextStyles{

  static final textStyle = TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500);

  //theme
  static final titleTextStyle = TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 22.sp,fontFamily: uiFontFamily) ;
  static final buttonTextStyle = TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 16.sp,fontFamily: uiFontFamily) ;
  static final headline1 = TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 22.sp,fontFamily: uiFontFamily);
  static final headline2 = TextStyle(color:Colors.black,fontWeight: FontWeight.w500,fontSize: 20.sp,fontFamily: uiFontFamily);
  static final bodyText2 = TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16.sp,fontFamily: uiFontFamily);
  static final bodyText1 = TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 18.sp,fontFamily: uiFontFamily);
  static final subtitle1 = TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 20.sp,fontFamily: uiFontFamily);

  //signUp text Style

  static final appbarTextStyle = titleTextStyle.copyWith(color: MyColor.white,fontWeight: FontWeight.w600,fontSize: 18.sp,fontFamily: uiFontFamily) ;

  static final fieldTextStyle = titleTextStyle.copyWith(color: MyColor.textColor,fontWeight: FontWeight.w400,fontSize: 16.sp,fontFamily: uiFontFamily) ;
  static final hintTextStyle = titleTextStyle.copyWith(color: MyColor.textHintColor,fontWeight: FontWeight.w400,fontSize: 16.sp,fontFamily: uiFontFamily) ;

  static final dateTextStyle = titleTextStyle.copyWith(color: MyColor.dateTextColor,fontWeight: FontWeight.w500,fontSize: 14.sp,fontFamily: uiFontFamily) ;








  static final _lightScreenHeading1TextStyle = TextStyle(fontSize: 26.0.sp,fontWeight:FontWeight.bold, color: MyColor.black,fontFamily: uiFontFamily);

  static final darkScreenHeading1TextStyle = _lightScreenHeading1TextStyle.copyWith(color: MyColor.white);
}