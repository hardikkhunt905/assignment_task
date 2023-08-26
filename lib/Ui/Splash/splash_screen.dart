import 'package:assignment_task/Routing/Routes.dart';
import 'package:flutter/material.dart';
import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Elements/Widgets/toast.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/Utils/utils.dart';
import '../../Constants/preferences.dart';
import '../../Routing/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{

  bool isInternet = false;
  @override
  void initState() {
    super.initState();
    _toHomeScreen();
  }

  _toHomeScreen() async{
    await Future.delayed(const Duration(seconds: 5), () async{
      AppNavigator.replaceWith(Routes.homeScreen);
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 5000),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        body:
        Center(
          child: Container(
            child: FadeTransition(
              opacity: _animation,
              child: Image.asset(
                ImagePath.flutterLogo,
                height: 150.h,
              )),
            ),
        ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
