import 'package:bloc_base_structure/Ui/Add_Employee/Bloc/add_employee_bloc.dart';
import 'package:bloc_base_structure/Ui/Home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {

  AppBloc._internal();

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  static final homeBloc = HomeBloc();
  static final addEmployeeBloc = AddEmployeeBloc();


  static final List<BlocProvider> providers = [

    BlocProvider<HomeBloc>(
      create: (context) => homeBloc,
    ),
    //
    // BlocProvider<AddEmployeeBloc>(
    //   create: (context) => addEmployeeBloc,
    // ),

  ];

  static void dispose() {
    homeBloc.close();
    addEmployeeBloc.close();
  }

}
