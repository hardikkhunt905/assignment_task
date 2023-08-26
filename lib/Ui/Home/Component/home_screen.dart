import 'package:bloc_base_structure/Blocs/app_bloc.dart';
import 'package:bloc_base_structure/Elements/Widgets/common_widgets.dart';
import 'package:bloc_base_structure/Ui/Home/bloc/home_bloc.dart';
import 'package:bloc_base_structure/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:bloc_base_structure/Elements/Widgets/toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: CommonWidgets.customAppBar(title: MyString.employeeList),
      floatingActionButton: _floatingActionButton(),
      body: SafeArea(child: _bodyWidget()),
    );
  }

  Widget _bodyWidget(){
    return Center(
      child: Image.asset(ImagePath.noRecordImage,width: Sizes.WIDTH_244,height: Sizes.WIDTH_244,),
    );
  }

  Widget _floatingActionButton(){
    return FloatingActionButton(
        heroTag: MyString.employeeList,
        backgroundColor: MyColor.appTheme,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_8)),
        onPressed: () => AppBloc.homeBloc.add(OnAddEmployee()),
        child: Image.asset(IconPath.plusIcon,
        width: Sizes.WIDTH_18,
        height: Sizes.WIDTH_18,
        fit: BoxFit.cover),
    );
  }
}
