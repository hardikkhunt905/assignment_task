part of 'edit_employee_bloc.dart';

@immutable
abstract class EditEmployeeState {}

class EditEmployeeInitial extends EditEmployeeState {
  final bool isDataFetched;

  EditEmployeeInitial(this.isDataFetched);
}

class GetEmployeeDataState extends EditEmployeeState {
  final EmployeeData employeeData;

  GetEmployeeDataState(this.employeeData);
}

class RoleSelectionState extends EditEmployeeState{
  final String? selectedRole;

  RoleSelectionState(this.selectedRole);}

class FromDateSelectionState extends EditEmployeeState{
  final DateTime? selectedFromDate;

  FromDateSelectionState(this.selectedFromDate);
}

class ToDateSelectionState extends EditEmployeeState{
  final DateTime? selectedToDate;

  ToDateSelectionState(this.selectedToDate);
}