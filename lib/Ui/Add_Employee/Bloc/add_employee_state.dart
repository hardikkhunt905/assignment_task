part of 'add_employee_bloc.dart';

@immutable
abstract class AddEmployeeState {
  String? selectedRole;
  AddEmployeeState(this.selectedRole);

}

class AddEmployeeInitial extends AddEmployeeState {
  AddEmployeeInitial(super.selectedRole);
}

class RoleSelectionState extends AddEmployeeState{
  RoleSelectionState(super.selectedRole);
}