import 'package:assignment_task/Constants/Extensions/extensions.dart';
import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Elements/Widgets/common_widgets.dart';
import 'package:assignment_task/Elements/Widgets/spaces.dart';
import 'package:assignment_task/Ui/Add_Employee/Bloc/add_employee_bloc.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Constants/Utils/utils.dart';
import '../../../Elements/Widgets/calender_widget.dart';
import '../../../themes/Style/text_styles.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddEmployeeBloc>(
      create: (context) => AddEmployeeBloc(),
      child: BlocBuilder<AddEmployeeBloc, AddEmployeeState>(
          builder: (context, state) {
            final bloc = context.read<AddEmployeeBloc>();
            return Scaffold(
            bottomSheet: _bottomSheet(context: context,bloc:bloc),
            appBar: CommonWidgets.customAppBar(title: MyString.addEmployeeDetails),
            body: _bodyWidget(bloc,context,state),
          );
        }
      ),
    );
  }

  Widget _bodyWidget(AddEmployeeBloc bloc, BuildContext context, AddEmployeeState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Sizes.WIDTH_16, horizontal: Sizes.WIDTH_16),
        child: Form(
              child: Column(
                children: [
                  const SpaceH24(),
                  _textField(
                      controller: bloc.nameController, hint: MyString.nameHint),
                  const SpaceH23(),
                  dropDownWidget(bloc, state, context),
                  const SpaceH26(),
                  selectDateWidget(bloc, state, context)
                ],
              ),
            )
      ),
    );
  }

  Widget _textField(
      {required TextEditingController controller, required String hint}) {
    return CommonWidgets.textFieldWidget(
        controller: controller,
        hint: hint,
        prefixPath: IconPath.nameIcon,
        hasPrefixIcon: true);
  }

  Widget dropDownWidget(
      AddEmployeeBloc bloc, AddEmployeeState state, BuildContext context) {
    bool isRoleSelected = bloc.selectedRole != null;
    String roleText = isRoleSelected ? bloc.selectedRole! : MyString.selectRole;
    TextStyle textStyle =
        isRoleSelected ? TextStyles.fieldTextStyle : TextStyles.hintTextStyle;
    return GestureDetector(
      onTap: () => openBottomDialog(context, bloc),
      child: Container(
        decoration: Decorations.fieldBorderBoxDecoration(),
        child: Row(
          children: [
            CommonWidgets.customIcon(
                iconPath: IconPath.roleIcon,
                color: MyColor.appTheme,
                size: Sizes.WIDTH_18),
            Text(
              roleText,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }

  void openBottomDialog(BuildContext context, AddEmployeeBloc bloc) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(bloc.roleList.length, (index) {
              return menuListItem(
                  context: context,
                  optionText: bloc.roleList[index],
                  index: index,
                  bloc: bloc);
            }));
      },
    );
    if (result != null) {
      bloc.add(SelectRoleChanged(result));
    }
  }

  Widget menuListItem(
      {required BuildContext context,
      required String optionText,
      required int index,
      required AddEmployeeBloc bloc}) {
    return Container(
      decoration: (bloc.roleList.length - 1) == index
          ? null
          : BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: MyColor.gray.withOpacity(0.1)))),
      child: ListTile(
        title: Text(optionText,
            style: TextStyles.bodyText2, textAlign: TextAlign.center),
        onTap: () {
          Navigator.pop(context, optionText);
        },
      ),
    );
  }

  Widget selectDateWidget(
      AddEmployeeBloc bloc, AddEmployeeState state, BuildContext context) {
    bool isFromDateSelected = bloc.selectedFromDate != null;
    String fromDateText = isFromDateSelected
        ? bloc.selectedFromDate!.toDialogDate()
        : MyString.today;
    bool isToDateSelected = bloc.selectedToDate != null;
    String toDateText = isToDateSelected
        ? bloc.selectedToDate!.toDialogDate()
        : MyString.noDate;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: dateItemWidget(
              state: state,
              onTap: () => openSelectDateDialog(context: context, bloc: bloc),
              date: fromDateText),
        ),
        CommonWidgets.customIcon(
            iconPath: IconPath.rightArrowIcon,
            color: MyColor.appTheme,
            size: Sizes.WIDTH_14),
        Expanded(
          child: dateItemWidget(
              state: state,
              textColor: isToDateSelected ? MyColor.textColor : MyColor.gray,
              onTap: () => openSelectDateDialog(
                  context: context, bloc: bloc, isToDate: true),
              date: toDateText),
        ),
      ],
    );
  }

  Widget dateItemWidget(
      {void Function()? onTap,
      required String date,
      Color? textColor,
      required AddEmployeeState state}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth / 2.5,
        decoration: Decorations.fieldBorderBoxDecoration(),
        child: Row(
          children: [
            CommonWidgets.customIcon(
                iconPath: IconPath.calendarIcon,
                color: MyColor.appTheme,
                size: Sizes.WIDTH_18),
            Text(
              date,
              style: TextStyles.dateTextStyle.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  void openSelectDateDialog(
      {required BuildContext context,
      required AddEmployeeBloc bloc,
      bool? isToDate}) async {
    DateTime? selectedDate = await showDialog(
      context: context,
      builder: (context) {
        return CustomDatePickerDialog(isToDate: isToDate ?? false,fromDate : bloc.selectedFromDate,toDate: bloc.selectedToDate,);
      },
    );
    if (selectedDate != null) {
      isToDate ?? false
          ? bloc.add(SelectedToDateChanged(selectedDate))
          : bloc.add(SelectedFromDateChanged(selectedDate));
    }
  }

  Widget _bottomSheet({required BuildContext context, required AddEmployeeBloc bloc}) {
    return Wrap(children: [
      Divider(
        height: Sizes.HEIGHT_2,
        color: MyColor.dividerColor,
      ),
      Padding(
          padding: EdgeInsets.symmetric(
              vertical: Sizes.HEIGHT_6, horizontal: Sizes.WIDTH_14),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonWidgets.customButton(
                          width: Sizes.WIDTH_90,
                          textColor: MyColor.appTheme,
                          onPressed: () => Navigator.pop(context),
                          buttonText: MyString.cancel,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              MyColor.buttonBgColor,
                            ),
                          )),
                      const SpaceW16(),
                      CommonWidgets.customButton(
                        width: Sizes.WIDTH_90,
                        textColor: MyColor.white,
                        onPressed: () => validateData(context,bloc),
                        buttonText: MyString.save,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
    ]);
  }

  Future<void> validateData(BuildContext context, AddEmployeeBloc bloc) async {
    // Validate employee name field
    if (bloc.nameController.text.isEmpty) {
      Utils.showSnackBar(
          context: context, value: "Employee name cannot be empty");
    } else if (bloc.selectedRole == null) {
      Utils.showSnackBar(context: context, value: "Please select a role");
    }else {
      bloc.add(SaveEmployeeDetails());
      Navigator.pop(context,true);
    }

  }
}
