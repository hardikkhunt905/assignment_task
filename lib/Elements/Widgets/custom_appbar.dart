import 'package:flutter/material.dart';
import 'package:bloc_base_structure/Constants/Utils/utils.dart';
import 'package:bloc_base_structure/Elements/Widgets/custom_title.dart';
import 'package:bloc_base_structure/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget{

  final String title;
  final Widget? customTitle;
  final double? height;
  final double? iconSize;
  final Function? prefixAction;
  final Function? suffixAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? animateTitile;
  final bool animation;

  const CustomAppBar({Key? key,this.animation = false , required this.title,this.animateTitile,this.height,this.prefixAction,this.suffixIcon,this.prefixIcon,this.suffixAction,this.iconSize,this.customTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        height: height ?? preferredSize.height,
        decoration: const BoxDecoration(color: MyColor.appTheme),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  <Widget>[
              SizedBox(
                height: iconSize ?? 40.w,
                width:  iconSize ?? 40.w,
                child: Center(
                  child: InkWell(
                    onTap:  ()=> prefixAction != null ? prefixAction!() : null,
                    child: prefixIcon ?? const SizedBox(),
                  ),
                ),
              ),
              Expanded(child:Center(child:  customTitle ??  CustomTitle(title: title))),
              SizedBox(
                height: iconSize ?? 40.w,
                width:  iconSize ?? 40.w,
                child: Center(
                  child: InkWell(
                    onTap:  ()=> suffixAction != null ? suffixAction!() : null,
                    child: suffixIcon ?? const SizedBox(),
                  ) ,
                ),
              ),
            ]),
      );
  }

  @override
  Size get preferredSize => Size(100.w, height ??  40.h);
}
