import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Constants/constants.dart';
import '../../../Helper/database_helper.dart';
import '../../../Models/EmployeeData/employee_data.dart';

part 'edit_employee_event.dart';

part 'edit_employee_state.dart';

class EditEmployeeBloc extends Bloc<EditEmployeeEvent, EditEmployeeState> {
  EmployeeData employee = EmployeeData();
  final nameController = TextEditingController();
  List<String> roleList = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner'
  ];
  String? selectedRole;
  DateTime? selectedFromDate;
  DateTime? selectedToDate;
  bool isDataFetched = false;

  final DatabaseHelper databaseHelper = DatabaseHelper();

  EditEmployeeBloc() : super(EditEmployeeInitial(false)) {
    on<EditEmployeeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetEmployeeDataEvent>((event, emit) {
      if (!isDataFetched) {
        employee = event.employeeData;
        Debug.setLog("here is first time data --> ${employee.toJson()}");
        nameController.text = employee.name;
        selectedRole = employee.role;
        selectedFromDate = DateTime.parse(employee.fromDate);
        selectedToDate = employee.toDate.isNotEmpty ? DateTime.parse(employee.fromDate) : null;
        isDataFetched = true;
        emit(GetEmployeeDataState(employee));
      }
    });

    on<SelectRoleChanged>((event, emit) {
      FocusManager.instance.primaryFocus?.unfocus();
      selectedRole = event.selectedRole;
      emit(RoleSelectionState(event.selectedRole));
    });

    on<SelectedFromDateChanged>((event, emit) {
      FocusManager.instance.primaryFocus?.unfocus();
      selectedFromDate = event.selectedFromDate;

      if (selectedToDate != null &&
          selectedFromDate!.isAfter(selectedToDate!)) {
        selectedToDate = null;
      }
      emit(FromDateSelectionState(event.selectedFromDate));
    });

    on<SelectedToDateChanged>((event, emit) {
      FocusManager.instance.primaryFocus?.unfocus();
      selectedToDate = event.selectedToDate;
      emit(ToDateSelectionState(event.selectedToDate));
    });

    on<EditEmployeeDetails>((event, emit) async {
      await editEmployeeDetails();
    });
  }

  Future<void> editEmployeeDetails() async {

     employee =  employee
         .copyWith(
       name: nameController.text,
       role: selectedRole!,
       fromDate: (selectedFromDate ?? DateTime.now()).toIso8601String(),
       toDate: selectedToDate != null ? selectedToDate!.toIso8601String() : "",
     );
    Debug.setLog("here is last time data --> ${employee.toJson()}");

    await databaseHelper.updateEmployee(
      employee.toJson(),
    );

  }
}
