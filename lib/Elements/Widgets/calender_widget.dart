import 'package:assignment_task/Constants/Extensions/extensions.dart';
import 'package:assignment_task/Constants/constants.dart';
import 'package:assignment_task/Elements/Widgets/common_widgets.dart';
import 'package:assignment_task/Elements/Widgets/spaces.dart';
import 'package:assignment_task/Values/values.dart';
import 'package:assignment_task/themes/Style/text_styles.dart';
import 'package:flutter/material.dart';
import '../Lib/table_calendar/table_calendar.dart';

class ButtonInfo {
  final String label;
  final Color defaultColor;
  final Color selectedColor;

  ButtonInfo(this.label, this.defaultColor, this.selectedColor);
}

class CustomDatePickerDialog extends StatefulWidget {
  final bool isToDate;
  final DateTime? fromDate;
  final DateTime? toDate;

  const CustomDatePickerDialog({Key? key, required this.isToDate, required this.fromDate, this.toDate})
      : super(key: key);

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  DateTime? _selectedDate;
  DateTime _focusedDay = DateTime.now();
  DateTime firstDay = DateTime(DateTime.now().year - 20, 1, 1);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int selectedButtonIndex = -1;
  int toButtonIndex = 0;
  List<ButtonInfo> buttons = [
    ButtonInfo(MyString.today, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(MyString.nextMonday, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(
        MyString.nextTuesday, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(MyString.afterWeek, MyColor.buttonColor, MyColor.buttonBgColor),
  ];

  List<ButtonInfo> toDateButtons = [
    ButtonInfo(MyString.noDate, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(MyString.today, MyColor.buttonColor, MyColor.buttonBgColor),
  ];

  void _handleButtonClick(int index) {
    _selectedDate = _selectedDate ?? DateTime.now();
    setState(() {
      if (selectedButtonIndex == index) {
        selectedButtonIndex = -1; // Deselect the button
      } else {
        selectedButtonIndex = index;
      }
      if (index == 0) {
        _selectedDate = DateTime.now();
      } else if (index == 1) {
        DateTime nextMonday = _selectedDate!;
        while (nextMonday.weekday != DateTime.monday) {
          nextMonday = nextMonday.add(const Duration(days: 1));
        }
        _selectedDate = nextMonday;
      } else if (index == 2) {
        DateTime nextMonday = _selectedDate!;
        while (nextMonday.weekday != DateTime.tuesday) {
          nextMonday = nextMonday.add(const Duration(days: 1));
        }
        _selectedDate = nextMonday;
      } else {
        _selectedDate = DateTime.now().add(const Duration(days: 7));
      }
    });
  }

  void _handleToDateButtonClick(int index) {
    setState(() {
      if (toButtonIndex == index) {
        toButtonIndex = -1; // Deselect the button
      } else {
        toButtonIndex = index;
      }
      if (index == 0) {
        _selectedDate = null;
      } else {
        _selectedDate = DateTime.now();
      }
    });
  }


  @override
  void initState() {
    super.initState();
    setFirstDay();
  }
  void setFirstDay(){
    if(widget.fromDate != null){
      firstDay = widget.fromDate!;
      _focusedDay = widget.fromDate!;
    }

  }

  @override
  Widget build(BuildContext context) {
    if(!widget.isToDate && _selectedDate == null) {
      if(widget.fromDate != null){
        _selectedDate = widget.fromDate;
      }else{
        _selectedDate = DateTime.now();
      }
    }
    if(widget.isToDate && widget.toDate != null && _selectedDate == null){
      _selectedDate = widget.toDate;
    }
    // if user select to date first and after select from date( before date )
    // if (widget.isToDate && _focusedDay.isBefore(widget.fromDate!)) {
    //   _focusedDay = widget.fromDate!;
    // }
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_10),
            child: Column(
              children: [
                const SpaceH24(),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // 2 buttons in each row
                        mainAxisSpacing: Sizes.WIDTH_16,
                        crossAxisSpacing: Sizes.WIDTH_16,
                        mainAxisExtent: Sizes.HEIGHT_50),
                    shrinkWrap: true,
                    itemCount:
                        widget.isToDate ? toDateButtons.length : buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      ButtonInfo buttonInfo = widget.isToDate
                          ? toDateButtons[index]
                          : buttons[index];
                      bool isSelected = index ==
                          (widget.isToDate
                              ? toButtonIndex
                              : selectedButtonIndex);
                      return CommonWidgets.customButton(
                          onPressed: () => widget.isToDate
                              ? _handleToDateButtonClick(index)
                              : _handleButtonClick(index),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              isSelected
                                  ? buttonInfo.defaultColor
                                  : buttonInfo.selectedColor,
                            ),
                          ),
                          buttonText: buttonInfo.label,
                          textColor:
                              isSelected ? Colors.white : MyColor.appTheme);
                    }),
                TableCalendar(
                  firstDay: firstDay,
                  lastDay: DateTime(DateTime.now().year + 5, 12, 31),
                  focusedDay: _focusedDay,
                  // currentDay: _selectedDate,
                  calendarFormat: _calendarFormat,
                  calendarStyle: CalendarStyle(
                      selectedDecoration: const BoxDecoration(
                          color: MyColor.appTheme, shape: BoxShape.circle),
                      todayDecoration: BoxDecoration(
                          border: Border.all(
                              color: widget.isToDate
                                  ? MyColor.transparent
                                  : MyColor.appTheme),
                          color: MyColor.transparent,
                          shape: BoxShape.circle),
                      todayTextStyle: const TextStyle(color: MyColor.appTheme)),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyles.appbarTextStyle
                        .copyWith(color: MyColor.textColor),
                    leftChevronIcon: CommonWidgets.customIcon(
                        iconPath: IconPath.leftTabIcon,
                        color: MyColor.appTheme),
                    rightChevronIcon: CommonWidgets.customIcon(
                        iconPath: IconPath.rightTabIcon,
                        color: MyColor.appTheme),
                    headerMargin: const EdgeInsets.all(0),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDate, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDate = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Sizes.HEIGHT_16),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Sizes.WIDTH_8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(IconPath.calendarIcon,
                                height: Sizes.WIDTH_23,
                                width: Sizes.WIDTH_23,
                                color: MyColor.appTheme),
                            const SpaceW8(),
                            Text(_selectedDate != null
                                ? _selectedDate!.toDialogDate()
                                : MyString.noDate),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.WIDTH_10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonWidgets.customButton(
                                  width: Sizes.WIDTH_90,
                                  textColor: MyColor.appTheme,
                                  onPressed: () => Navigator.pop(context),
                                  buttonText: MyString.cancel,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      MyColor.buttonBgColor,
                                    ),
                                  )),
                              const SpaceW12(),
                              CommonWidgets.customButton(
                                width: Sizes.WIDTH_90,
                                textColor: MyColor.white,
                                onPressed: () =>
                                    Navigator.pop(context, _selectedDate),
                                buttonText: MyString.save,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
