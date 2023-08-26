part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeState {}

class AddEmployeeInitial extends AddEmployeeState {}

class RoleSelectionState extends AddEmployeeState{
  final String? selectedRole;

  RoleSelectionState(this.selectedRole);}

class FromDateSelectionState extends AddEmployeeState{
  final DateTime? selectedFromDate;

  FromDateSelectionState(this.selectedFromDate);
}

class ToDateSelectionState extends AddEmployeeState{
  final DateTime? selectedToDate;

  ToDateSelectionState(this.selectedToDate);
}