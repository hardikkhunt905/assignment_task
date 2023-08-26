part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeEvent {}

class SelectRoleChanged extends AddEmployeeEvent {
  String? selectedRole;
  SelectRoleChanged(this.selectedRole);
}

class SelectedFromDateChanged extends AddEmployeeEvent {
  String? selectedFromDate;
  SelectedFromDateChanged(this.selectedFromDate);
}

class SelectedToDateChanged extends AddEmployeeEvent {
  String? selectedToDate;
  SelectedToDateChanged(this.selectedToDate);
}