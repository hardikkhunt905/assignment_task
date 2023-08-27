import 'package:assignment_task/Elements/Widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/constants.dart';
import '../../Values/values.dart';
import '../../themes/Style/text_styles.dart';

class CommonWidgets{

  static AppBar customAppBar({required String title,void Function()? onTap,bool? isActionIcon}) {
    return AppBar(
      title: Text(title,style: TextStyles.appbarTextStyle),
      actions: [
        isActionIcon ?? false ? GestureDetector(onTap: onTap,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: Sizes.WIDTH_20,vertical: Sizes.HEIGHT_10),
              child: Image.asset(IconPath.deleteIcon,width: Sizes.WIDTH_18,height: Sizes.WIDTH_18),
            )) : const SizedBox.shrink()
      ],
    );
  }

  static Widget textFieldWidget({
    required TextEditingController controller,
    required String hint,
    String? suffixPath,
    String? prefixPath,
    bool? hasSuffixIcon,
    bool? hasPrefixIcon,
    bool? obscureText,
    void Function()? onSuffixTap,
    void Function()? onPrefixTap,
    Color? prefixColor,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.HEIGHT_6),
      child: CustomTextFormField(
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText ?? false,
        controller: controller,
        hintText: hint,
        hintTextStyle: TextStyles.hintTextStyle,
        textStyle: TextStyles.fieldTextStyle,
        fillColor: MyColor.transparent,
        // borderColor: MyColor.grey,
        border: Decorations.textFieldBorder(color: MyColor.grey),
        focusedBorder: Decorations.textFieldBorder(color: MyColor.grey),
        enabledBorder: Decorations.textFieldBorder(color: MyColor.grey),
        suffixIcon: IconButton(
          icon: Image.asset(suffixPath ?? "",
              height: Sizes.WIDTH_18,
              width: Sizes.WIDTH_18,
              color: MyColor.appTheme),
          padding: EdgeInsets.only(right: Sizes.WIDTH_6),
          onPressed: onSuffixTap,
        ),
        hasSuffixIcon: hasSuffixIcon ?? false,
        hasPrefixIcon: hasPrefixIcon ?? false,
        prefixIcon: IconButton(
          icon: Image.asset(prefixPath ?? "",
              height: Sizes.WIDTH_18,
              width: Sizes.WIDTH_18,
              color: prefixColor ?? MyColor.appTheme
          ),
          padding: EdgeInsets.only(left: Sizes.WIDTH_4),
          onPressed: onPrefixTap,
        ),
      ),
    );
  }

  static Widget customButton(
      {required void Function()? onPressed,
        required String buttonText,
        ButtonStyle? style,
        double? width,
        Color? textColor}) {
    return SizedBox(
      width: width ?? screenWidth / 2.5,
      child: ElevatedButton(
          style: style,
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyles.dateTextStyle.copyWith(color: textColor),
          )),
    );
  }

  static Widget customIcon({required String iconPath,Color? color,double? size}) {
    return IconButton(
      icon: Image.asset(iconPath,
          height: size ?? Sizes.WIDTH_14,
          width: size ?? Sizes.WIDTH_14,
          color: color ?? MyColor.textHintColor),
      onPressed: null,
    );
  }

}