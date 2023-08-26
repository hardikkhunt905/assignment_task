part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class FetchEmployeeListState extends HomeState {
  final List<EmployeeData> employeeList;
  FetchEmployeeListState(this.employeeList);
}

class EmployeeListLoadedState extends HomeState {
  final List<EmployeeData> employeeList;
  EmployeeListLoadedState(this.employeeList);
}

class CurrentEmployeeListLoadedState extends HomeState {
  final List<EmployeeData> currentEmployeeList;
  CurrentEmployeeListLoadedState(this.currentEmployeeList);
}

class PreviousEmployeeListLoadedState extends HomeState {
  final List<EmployeeData> previousEmployeeList;
  PreviousEmployeeListLoadedState(this.previousEmployeeList);
}

class EmployeeListErrorState extends HomeState {
  final String employeeListError;
  EmployeeListErrorState(this.employeeListError);
}
