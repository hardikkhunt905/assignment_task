import 'dart:developer' as d;
import 'package:bloc_base_structure/Values/values.dart';

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


// Shared Preference
const isLogInPref = "Is User Log In";


// database
const databaseName = "database";
const userDataTable = "UserDataTable";
const waterDataTable = "WaterDataTable";

// Notification
const scheduleNotification = "scheduleNotification";

// Firebase
const application = "Application";
const appPackageName = "App Package Name";



class Debug {
  static void setLog(String val){
    if(debug) logger.d(val);
  }
  static void setErrorLog(String val){
    if(debug) logger.e(val);
  }
}