import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_base_structure/Constants/constants.dart';
import 'package:bloc_base_structure/themes/Style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {

  final nameController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  List<String> roleList = ['Product Designer', 'Flutter Developer', 'QA Tester','Product Owner'];


  AddEmployeeBloc() : super(AddEmployeeInitial(null)) {
    on<AddEmployeeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectRoleChanged>((event, emit) {
      emit(RoleSelectionState(event.selectedOption));
    });

  }


}
