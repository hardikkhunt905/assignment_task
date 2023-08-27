import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Constants/preferences.dart';
import 'package:assignment_task/Models/EmployeeData/employee_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Helper/database_helper.dart';
import '../../../Routing/Routes.dart';
import '../../../Routing/app_navigator.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  List<EmployeeData> employeeList = [];
  List<EmployeeData> currentEmployeeList = [];
  List<EmployeeData> previousEmployeeList = [];
  String employeeListError = "Something Is Wrong!";
  bool isLoading = false;

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });

    on<CheckFirstTimeEvent>((event, emit) async{
        bool isSecondTime = await Preferences.getPrefBool(deleteDialogPre);
      if (!isSecondTime) {
        Preferences.setPrefBool(deleteDialogPre, true);
        emit(ShowDeleteDialogState());
      }
    });

    on<FetchEmployeeListEvent>((event, emit) async {
      await getListData(emit: emit);
    });

    on<OnAddEmployee>((event, emit) async {
      bool shouldReloadData = await AppNavigator.push(Routes.addEmployeeScreen);
      if (shouldReloadData == true) {
        await getListData(emit: emit,);
      }
    });
  }

  Future<void> getListData({required Emitter<HomeState> emit,}) async {
    try {
      isLoading = true;
      employeeList = (await databaseHelper.getEmployees()).map((e) => EmployeeData.fromJson(e)).toList();
      Debug.setLog("here is employee List --> ${employeeList}");

      currentEmployeeList = employeeList.where((e) => e.toDate.isEmpty).toList();
      previousEmployeeList = employeeList.where((e) => e.toDate.isNotEmpty).toList();

      // Sort the lists by date
      currentEmployeeList.sort((b, a) => a.fromDate.compareTo(b.fromDate));
      previousEmployeeList.sort((b, a) => a.fromDate.compareTo(b.fromDate));


      // Emit the state containing the list of employees
      emit(EmployeeListLoadedState(employeeList));
      emit(CurrentEmployeeListLoadedState(currentEmployeeList));
      emit(PreviousEmployeeListLoadedState(previousEmployeeList));
      isLoading = false;
    } catch (e) {
      isLoading = false;
      Debug.setLog("employee List error --> ${e.toString()}");
      emit(EmployeeListErrorState(e.toString()));
    }
  }
}
