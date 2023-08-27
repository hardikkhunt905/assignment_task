part of 'values.dart';

class Decorations {

  static exitDialogBoxDecoration({
    double blurRadius = 5,
    Color color = const Color(0xFFD6D7FB),
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
  }) {
    return BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: borderRadius
    );
  }


  static fieldBorderBoxDecoration({
    Color? color,
    BorderRadiusGeometry? borderRadius,
  }) {
    return BoxDecoration(border: Border.all(color: MyColor.grey,width: 1),
        color: color,
        borderRadius: borderRadius ??  BorderRadius.circular(Sizes.RADIUS_8)
    );
  }

  static textFieldBorder({Color? color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? MyColor.white,width: 1),borderRadius: BorderRadius.circular(Sizes.RADIUS_8)
    );
  }


}
