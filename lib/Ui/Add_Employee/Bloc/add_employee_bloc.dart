import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Models/AddEmployeeData/add_employee_data.dart';
import 'package:assignment_task/Models/EmployeeData/employee_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Helper/database_helper.dart';
part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  final nameController = TextEditingController();
  List<String> roleList = ['Product Designer', 'Flutter Developer', 'QA Tester','Product Owner'];
  String? selectedRole;
  DateTime? selectedFromDate;
  DateTime? selectedToDate;

  final DatabaseHelper databaseHelper = DatabaseHelper();


  AddEmployeeBloc() : super(AddEmployeeInitial()) {

    on<AddEmployeeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectRoleChanged>((event, emit) {
      FocusManager.instance.primaryFocus?.unfocus();
      selectedRole = event.selectedRole;
      emit(RoleSelectionState(event.selectedRole));
    });

   on<SelectedFromDateChanged>((event, emit) {
     FocusManager.instance.primaryFocus?.unfocus();
     selectedFromDate = event.selectedFromDate;

     if (selectedToDate != null && selectedFromDate!.isAfter(selectedToDate!)) {
       selectedToDate = null;
     }
     emit(FromDateSelectionState(event.selectedFromDate));
    });

   on<SelectedToDateChanged>((event, emit) {
     FocusManager.instance.primaryFocus?.unfocus();
     selectedToDate = event.selectedToDate;
     emit(ToDateSelectionState(event.selectedToDate));
    });

   on<SaveEmployeeDetails>((event, emit) async{
     await saveEmployeeDetails();
   });

  }

  Future<void> saveEmployeeDetails() async {

    AddEmployeeData employeeData = AddEmployeeData();
    await databaseHelper.addEmployee(
      employeeData.copyWith(
          name: nameController.text,
          role: selectedRole!,
          fromDate: (selectedFromDate ?? DateTime.now()).toIso8601String(),
         toDate: selectedToDate != null ? selectedToDate!.toIso8601String() : "",
      ).toJson(),
    );

    Debug.setLog("here is database Employee value --> ${await databaseHelper.getEmployees()}");
  }


}
