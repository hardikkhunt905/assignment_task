part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeState {}

class AddEmployeeInitial extends AddEmployeeState {}

class RoleSelectionState extends AddEmployeeState{
  String? selectedRole;

  RoleSelectionState(this.selectedRole);}

class FromDateSelectionState extends AddEmployeeState{
  String? selectedFromDate;

  FromDateSelectionState(this.selectedFromDate);
}

class ToDateSelectionState extends AddEmployeeState{
  String? selectedToDate;

  ToDateSelectionState(this.selectedToDate);
}