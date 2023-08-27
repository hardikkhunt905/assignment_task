import 'package:assignment_task/Constants/Extensions/extensions.dart';
import 'package:assignment_task/Models/EmployeeData/employee_data.dart';
import 'package:assignment_task/Ui/Edit_Employee/Bloc/edit_employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Constants/Utils/utils.dart';
import '../../../Constants/constants.dart';
import '../../../Elements/Widgets/calender_widget.dart';
import '../../../Elements/Widgets/common_widgets.dart';
import '../../../Elements/Widgets/spaces.dart';
import '../../../Values/values.dart';
import '../../../themes/Style/text_styles.dart';

class EditEmployeeScreen extends StatelessWidget {
  const EditEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditEmployeeBloc>(
      create: (context) => EditEmployeeBloc(),
      child: BlocBuilder<EditEmployeeBloc, EditEmployeeState>(
          builder: (context, state) {
            final bloc = context.read<EditEmployeeBloc>();
            final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
            final EmployeeData employee = args['employee'];
            if (!bloc.isDataFetched) {
              bloc.add(GetEmployeeDataEvent(employee));
            }
            return Scaffold(
              bottomSheet: _bottomSheet(context: context,bloc:bloc),
              appBar: CommonWidgets.customAppBar(title: MyString.editEmployeeDetails,onTap: () async{
               bool isBack = await showDialog(
                 context: context,
                 builder: (BuildContext dialogContext) {
                   return AlertDialog(
                     title: Text(MyString.deleteEmployee, style: TextStyles.titleTextStyle,),
                     content: Text('${MyString.deleteConfirmation} this Employee ${employee.name}?',style: TextStyles.fieldTextStyle),
                     actions: <Widget>[
                       TextButton(
                         onPressed: () {
                           Navigator.of(dialogContext).pop(false);
                         },
                         child: const Text(MyString.cancel),
                       ),
                       TextButton(
                         onPressed: () {
                           bloc.databaseHelper.deleteEmployee(employee.id);

                           Navigator.of(dialogContext).pop(true);

                           Utils.showSnackBar(context: context, value: MyString.deleteSuccess);
                         },
                         child: const Text(MyString.delete),
                       ),
                     ],
                   );
                 },
               );
               if(isBack){
                 Navigator.of(context).pop(true);
               }
              },isActionIcon: true),
              body: _bodyWidget(bloc,context,state),
            );
          }
      ),
    );
  }

  Widget _bodyWidget(EditEmployeeBloc bloc, BuildContext context, EditEmployeeState state) {
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
      EditEmployeeBloc bloc, EditEmployeeState state, BuildContext context) {
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

  void openBottomDialog(BuildContext context, EditEmployeeBloc bloc) async {
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
        required EditEmployeeBloc bloc}) {
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
      EditEmployeeBloc bloc, EditEmployeeState state, BuildContext context) {
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
        required EditEmployeeState state}) {
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
        required EditEmployeeBloc bloc,
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

  Widget _bottomSheet({required BuildContext context, required EditEmployeeBloc bloc}) {
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

  Future<void> validateData(BuildContext context, EditEmployeeBloc bloc) async {
    // Validate employee name field
    if (bloc.nameController.text.isEmpty) {
      Utils.showSnackBar(
          context: context, value: "Employee name cannot be empty");
    } else if (bloc.selectedRole == null) {
      Utils.showSnackBar(context: context, value: "Please select a role");
    }else {
      bloc.add(EditEmployeeDetails());
      Navigator.pop(context,true);
    }

  }
}
