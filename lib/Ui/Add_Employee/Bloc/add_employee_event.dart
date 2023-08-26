part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeEvent {
  String? selectedOption;

  AddEmployeeEvent(this.selectedOption);
}

class SelectRoleChanged extends AddEmployeeEvent {
  SelectRoleChanged(super.selectedOption);
}