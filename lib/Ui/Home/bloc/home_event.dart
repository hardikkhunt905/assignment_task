part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class OnAddEmployee extends HomeEvent{}

class CheckFirstTimeEvent extends HomeEvent {}

class ShowDeleteDialogState extends HomeState {}


class FetchEmployeeListEvent extends HomeEvent {
  final List<EmployeeData> employeeList;
  FetchEmployeeListEvent(this.employeeList);
}

class EmployeeListLoadedEvent extends HomeEvent {
  final List<EmployeeData> employeeList;
  EmployeeListLoadedEvent(this.employeeList);
}

class CurrentEmployeeListLoadedEvent extends HomeEvent {
  final List<EmployeeData> currentEmployeeList;
  CurrentEmployeeListLoadedEvent(this.currentEmployeeList);
}

class PreviousEmployeeListLoadedEvent extends HomeEvent {
  final List<EmployeeData> previousEmployeeList;
  PreviousEmployeeListLoadedEvent(this.previousEmployeeList);
}

class EmployeeListErrorEvent extends HomeEvent {
  final String employeeListError;
  EmployeeListErrorEvent(this.employeeListError);
}