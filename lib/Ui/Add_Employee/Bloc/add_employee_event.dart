part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeEvent {}

class SelectRoleChanged extends AddEmployeeEvent {
  final String? selectedRole;
  SelectRoleChanged(this.selectedRole);
}

class SelectedFromDateChanged extends AddEmployeeEvent {
  final DateTime? selectedFromDate;
  SelectedFromDateChanged(this.selectedFromDate);
}

class SelectedToDateChanged extends AddEmployeeEvent {
  final DateTime? selectedToDate;
  SelectedToDateChanged(this.selectedToDate);
}

class SaveEmployeeDetails extends AddEmployeeEvent {}
