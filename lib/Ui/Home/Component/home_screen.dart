import 'package:assignment_task/Blocs/app_bloc.dart';
import 'package:assignment_task/Constants/Extensions/extensions.dart';
import 'package:assignment_task/Constants/Utils/utils.dart';
import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Elements/Widgets/common_widgets.dart';
import 'package:assignment_task/Models/EmployeeData/employee_data.dart';
import 'package:assignment_task/Routing/Routes.dart';
import 'package:assignment_task/Routing/app_navigator.dart';
import 'package:assignment_task/Ui/Home/bloc/home_bloc.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:assignment_task/themes/Style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc.homeBloc.add(CheckFirstTimeEvent());
    AppBloc.homeBloc.add(FetchEmployeeListEvent(const []));
    return Scaffold(
      appBar: CommonWidgets.customAppBar(title: MyString.employeeList),
      floatingActionButton: _floatingActionButton(),
      body: SafeArea(child: _bodyWidget()),
    );
  }

  Widget _bodyWidget() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        if (state is ShowDeleteDialogState) {
          showDeleteDialog(context); // Call the function to show the dialog
        }
          if (bloc.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (!bloc.isLoading && state is EmployeeListErrorState) {
            return Center(child: Text(bloc.employeeListError));
          } else if (!bloc.isLoading && bloc.employeeList.isEmpty) {
            // Show no data image
            return Center(
              child: Image.asset(
                ImagePath.noRecordImage,
                width: Sizes.WIDTH_244,
                height: Sizes.WIDTH_244,
              ),
            );
          } else {
            return Column(
              children: [
                bloc.currentEmployeeList.isNotEmpty
                    ? Expanded(
                  child: Column(
                    children: [
                      titleContainer(title: MyString.currentEmployees),
                      Expanded(child: listWidget(isFrom: true, bloc: bloc)),
                    ],
                  ),
                )
                    : const SizedBox.shrink(),
                bloc.previousEmployeeList.isNotEmpty
                    ? Expanded(
                  child: Column(
                    children: [
                      titleContainer(title: MyString.previousEmployees),
                      Expanded(child: listWidget(isFrom: false, bloc: bloc)),
                    ],
                  ),
                )
                    : const SizedBox.shrink(),
              ],
            );
          }
      },
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      heroTag: MyString.employeeList,
      backgroundColor: MyColor.appTheme,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_8)),
      onPressed: () => AppBloc.homeBloc.add(OnAddEmployee()),
      child: Image.asset(IconPath.plusIcon,
          width: Sizes.WIDTH_18, height: Sizes.WIDTH_18, fit: BoxFit.cover),
    );
  }

  Widget listWidget({required bool isFrom, required HomeBloc bloc}) {
    return SizedBox(
      height: screenHeightOrg / 2.6,
      child: ListView.builder(
        itemCount: isFrom
            ? bloc.currentEmployeeList.length
            : bloc.previousEmployeeList.length,
        itemBuilder: (context, index) {
          EmployeeData employee = isFrom
              ? bloc.currentEmployeeList[index]
              : bloc.previousEmployeeList[index];
          return listItem(employee: employee, isFrom: isFrom,bloc:bloc,context:context);
        },
      ),
    );
  }

  Widget titleContainer({required String title}) {
    return Container(
      color: MyColor.titleBoxBgColor,
      padding: EdgeInsets.symmetric(
          vertical: Sizes.WIDTH_18, horizontal: Sizes.WIDTH_16),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyles.listTitleTextStyle.copyWith(color: MyColor.appTheme),
      ),
    );
  }

  Widget listItem({required EmployeeData employee, required bool isFrom, required HomeBloc bloc, required BuildContext
  context}) {
    String fromDate = DateTime.parse(employee.fromDate).toListViewDate();
    String toDate =
        isFrom ? "" : DateTime.parse(employee.toDate).toListViewDate();
    EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        horizontal: Sizes.WIDTH_10, vertical: Sizes.WIDTH_10);
    EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
        horizontal: Sizes.WIDTH_10, vertical: Sizes.WIDTH_4);
    return GestureDetector(
      onTap: () async {
        bool? edited = await AppNavigator.push(Routes.editEmployeeScreen,arguments:  {"employee": employee});
        if (edited ?? false) {
          AppBloc.homeBloc.add(FetchEmployeeListEvent(const []));
        }
      },
      child: Dismissible(
        key: Key(employee.id.toString()),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async{
          return await showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text(MyString.deleteEmployee, style: TextStyles.titleTextStyle,),
                content: Text('${MyString.deleteConfirmation} this Employee ${employee.name}?',style: TextStyles.fieldTextStyle),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop(false);
                    },
                    child: const Text(MyString.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      // Delete employee entry from SQLite database
                      bloc.databaseHelper.deleteEmployee(employee.id);
                      // Refresh the list
                      bloc.add(FetchEmployeeListEvent(const []));

                      Navigator.of(dialogContext).pop(true);

                      Utils.showSnackBar(context: context, value: MyString.deleteSuccess);
                    },
                    child: const Text(MyString.delete),
                  ),
                ],
              );
            },
          );
        },
        background: Row(
          children: [
            const Expanded(child: SizedBox()),
            Container(
              height: Sizes.WIDTH_100,width: Sizes.WIDTH_100,
              color: Colors.red,
              alignment: Alignment.center,
              child: Image.asset(IconPath.deleteIcon,color: Colors.white,width: Sizes.WIDTH_18,),
            ),
          ],
        ),
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: contentPadding,
                child: Text(
                  employee.name,
                  style: TextStyles.listTitleTextStyle,
                ),
              ),
              Padding(
                padding: contentPadding,
                child: Text(
                  employee.role,
                  style: TextStyles.listSubTitleTextStyle,
                ),
              ),
              Padding(
                padding: contentPadding,
                child: Text(
                  isFrom ? "${MyString.from} $fromDate" : "$fromDate - $toDate",
                  style: TextStyles.listSubTitleTextStyle
                      .copyWith(fontSize: Sizes.TEXT_SIZE_12),
                ),
              ),
              // Display other emp
              // loyee details as needed
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text(MyString.deleteEmployee,style: TextStyles.titleTextStyle,),
            content:  Text(MyString.swipeLeftToDelete,style: TextStyles.fieldTextStyle,),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:  Text(MyString.ok,style: TextStyles.titleTextStyle,),
              ),
            ],
          );
        },
      );
    });
  }

}
