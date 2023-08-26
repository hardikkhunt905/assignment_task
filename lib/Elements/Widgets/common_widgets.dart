import 'package:bloc_base_structure/Elements/Widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Values/values.dart';
import '../../themes/Style/text_styles.dart';

class CommonWidgets{

  static AppBar customAppBar({required String title}) {
    return AppBar(
      title: Text(title,style: TextStyles.appbarTextStyle),
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


}