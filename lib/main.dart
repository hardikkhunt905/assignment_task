import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Routing/pages.dart';
import 'package:assignment_task/Ui/Splash/splash_screen.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Blocs/app_bloc.dart';
import 'Observer/app_bloc_observer.dart';
import 'Routing/app_navigator.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: Size(428.w, 926.h),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: AppBloc.providers,
          child: MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: MyString.assignment,
            routes: Pages.pages,
            scrollBehavior: MyCustomScrollBehavior(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
