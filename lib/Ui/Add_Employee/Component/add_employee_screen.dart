import 'package:bloc_base_structure/Blocs/app_bloc.dart';
import 'package:bloc_base_structure/Constants/constants.dart';
import 'package:bloc_base_structure/Elements/Widgets/common_widgets.dart';
import 'package:bloc_base_structure/Elements/Widgets/spaces.dart';
import 'package:bloc_base_structure/Ui/Add_Employee/Bloc/add_employee_bloc.dart';
import 'package:bloc_base_structure/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Elements/Widgets/calender_widget.dart';
import '../../../themes/Style/text_styles.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.customAppBar(title: MyString.addEmployeeDetails),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return BlocProvider<AddEmployeeBloc>(
      create: (context) => AddEmployeeBloc(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Sizes.WIDTH_16, horizontal: Sizes.WIDTH_16),
          child: BlocBuilder<AddEmployeeBloc, AddEmployeeState>(
            builder: (context, state) {
              final bloc = context.read<AddEmployeeBloc>();
              return Form(
                child: Column(
                  children: [
                    const SpaceH24(),
                    _textField(
                        controller: bloc.nameController,
                        hint: MyString.nameHint),
                    const SpaceH23(),
                    dropDownWidget(bloc, state, context),
                    const SpaceH23(),
                    selectDateWidget(bloc, state, context)
                  ],
                ),
              );
            },
          ),
        ),
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
    Debug.setLog("here is result --> ${state.selectedRole}");
    return GestureDetector(
      onTap: () => openBottomDialog(context, bloc),
      child: Container(
        decoration: Decorations.fieldBorderBoxDecoration(),
        child: Row(
          children: [
            customIcon(iconPath: IconPath.roleIcon),
            Text(
              state.selectedRole != null
                  ? state.selectedRole!
                  : MyString.selectRole,
              style: state.selectedRole != null
                  ? TextStyles.fieldTextStyle
                  : TextStyles.hintTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget customIcon({required String iconPath}) {
    return IconButton(
      icon: Image.asset(iconPath,
          height: Sizes.WIDTH_18,
          width: Sizes.WIDTH_18,
          color: MyColor.appTheme),
      onPressed: null,
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

  Widget selectDateWidget(AddEmployeeBloc bloc, AddEmployeeState state, BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: dateItemWidget(onTap: () => openSelectDateDialog(context, bloc),date : state.selectedRole != null
              ? state.selectedRole!
              : MyString.today),
        ),

        customIcon(iconPath: IconPath.rightArrowIcon),

        Expanded(
          child: dateItemWidget(onTap: () => openSelectDateDialog(context, bloc),date : state.selectedRole != null
              ? state.selectedRole!
              : MyString.today),
        ),
      ],
    );
  }

  Widget dateItemWidget({void Function()? onTap,required String date}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth/2.5,
        decoration: Decorations.fieldBorderBoxDecoration(),
        child: Row(
          children: [
            customIcon(iconPath: IconPath.calendarIcon),
            Text(date,
              style : TextStyles.dateTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  void openSelectDateDialog(BuildContext context, AddEmployeeBloc bloc){
    showDialog(context: context, builder: (context) {
      return CustomDatePickerDialog();
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Today')),
                  ElevatedButton(onPressed: () {}, child: Text('Next Monday')),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Next Tuesday')),
                  ElevatedButton(onPressed: () {}, child: Text('After 1 Week')),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8),
                  Text('March 2023'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: 16),
              Center(),
              Divider(),
              SizedBox(height: 16),
              Row(
                children: [
                  Row(
                    children: [
                      customIcon(iconPath: IconPath.calendarIcon),
                      Text('5 Sep, 2023'),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        SizedBox(width: Sizes.WIDTH_16),
                        ElevatedButton(
                          onPressed: () {
                            // Perform save operation
                          },
                          child: Text(MyString.save),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      );
    },);
  }
}
