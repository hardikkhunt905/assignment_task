part of 'edit_employee_bloc.dart';

@immutable
abstract class EditEmployeeEvent {}

class GetEmployeeDataEvent extends EditEmployeeEvent{
  final EmployeeData employeeData;

  GetEmployeeDataEvent(this.employeeData);
}

class SelectRoleChanged extends EditEmployeeEvent {
  final String? selectedRole;
  SelectRoleChanged(this.selectedRole);
}

class SelectedFromDateChanged extends EditEmployeeEvent {
  final DateTime? selectedFromDate;
  SelectedFromDateChanged(this.selectedFromDate);
}

class SelectedToDateChanged extends EditEmployeeEvent {
  final DateTime? selectedToDate;
  SelectedToDateChanged(this.selectedToDate);
}

class EditEmployeeDetails extends EditEmployeeEvent {}