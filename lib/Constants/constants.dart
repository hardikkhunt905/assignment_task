import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

const debug = true;
const countToastDebug = false;
const inDevelopment = true;

const uiFontFamily = 'Roboto';

var logger = Logger();

double screenWidth = ScreenUtil().screenWidth;
double screenHeight = ScreenUtil().screenWidth;
double screenHeightOrg = ScreenUtil().screenHeight;

//preference
const deleteDialogPre = "Delete Dialog Preference";

// database
const databaseName = "Employee_Database";
const tableName = "employees";

class Debug {
  static void setLog(String val){
    if(debug) logger.d(val);
  }
  static void setErrorLog(String val){
    if(debug) logger.e(val);
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}