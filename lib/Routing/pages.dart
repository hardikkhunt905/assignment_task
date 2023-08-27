import 'package:assignment_task/Routing/Routes.dart';
import 'package:assignment_task/Ui/Add_Employee/Component/add_employee_screen.dart';
import 'package:assignment_task/Ui/Edit_Employee/Component/edit_employee_screen.dart';
import 'package:flutter/material.dart';

import '../Ui/Home/Component/home_screen.dart';

class Pages {
  // {Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{}}
  static final pages = <String, WidgetBuilder>{

    Routes.homeScreen : (context) => HomeScreen(),
    Routes.addEmployeeScreen : (context) => AddEmployeeScreen(),
    Routes.editEmployeeScreen : (context) => EditEmployeeScreen(),
    // GetPage(name: Routes.homeScreen, page: () => HomeScreen(), popGesture: false),
    // GetPage(name: Routes.homeScreen, page: () => AdDemoScreen(), popGesture: false),
  };
}
