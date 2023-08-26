import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {

  final nameController = TextEditingController();
  List<String> roleList = ['Product Designer', 'Flutter Developer', 'QA Tester','Product Owner'];
  String? selectedRole;
  String? selectedFromDate;
  String? selectedToDate;


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
     emit(FromDateSelectionState(event.selectedFromDate));
    });

   on<SelectedToDateChanged>((event, emit) {
     FocusManager.instance.primaryFocus?.unfocus();
     selectedToDate = event.selectedToDate;
     emit(ToDateSelectionState(event.selectedToDate));
    });

  }


}
