import 'package:bloc_base_structure/Constants/Extensions/extensions.dart';
import 'package:bloc_base_structure/Constants/constants.dart';
import 'package:bloc_base_structure/Elements/Widgets/spaces.dart';
import 'package:bloc_base_structure/Values/values.dart';
import 'package:bloc_base_structure/themes/Style/text_styles.dart';
import 'package:flutter/material.dart';
import '../Lib/table_calendar/table_calendar.dart';

class ButtonInfo {
  final String label;
  final Color defaultColor;
  final Color selectedColor;

  ButtonInfo(this.label, this.defaultColor, this.selectedColor);
}

class CustomDatePickerDialog extends StatefulWidget {
  const CustomDatePickerDialog({Key? key}) : super(key: key);

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int selectedButtonIndex = -1;
  List<ButtonInfo> buttons = [
    ButtonInfo(MyString.today, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(MyString.nextMonday, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(
        MyString.nextTuesday, MyColor.buttonColor, MyColor.buttonBgColor),
    ButtonInfo(MyString.afterWeek, MyColor.buttonColor, MyColor.buttonBgColor),
  ];

  void _handleButtonClick(int index) {
    setState(() {
      if (selectedButtonIndex == index) {
        selectedButtonIndex = -1; // Deselect the button
      } else {
        selectedButtonIndex = index;
      }
      if (index == 0) {
        _selectedDate = DateTime.now();
      } else if (index == 1) {
        DateTime nextMonday = _selectedDate;
        while (nextMonday.weekday != DateTime.monday) {
          nextMonday = nextMonday.add(Duration(days: 1));
        }
        _selectedDate = nextMonday;
      } else if (index == 2) {
        DateTime nextMonday = _selectedDate;
        while (nextMonday.weekday != DateTime.tuesday) {
          nextMonday = nextMonday.add(Duration(days: 1));
        }
        _selectedDate = nextMonday;
      } else {
        _selectedDate = DateTime.now().add(Duration(days: 7));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
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
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      ButtonInfo buttonInfo = buttons[index];
                      bool isSelected = index == selectedButtonIndex;
                      return customButton(
                          onPressed: () => _handleButtonClick(index),
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
                  firstDay: DateTime(DateTime.now().year - 20, 1, 1),
                  lastDay: DateTime(DateTime.now().year + 5, 12, 31),
                  focusedDay: _focusedDay,
                  // currentDay: _selectedDate,
                  calendarFormat: _calendarFormat,
                  calendarStyle: CalendarStyle(
                      selectedDecoration: const BoxDecoration(
                          color: MyColor.appTheme, shape: BoxShape.circle),
                      todayDecoration: BoxDecoration(
                          border: Border.all(color: MyColor.appTheme),
                          color: MyColor.transparent,
                          shape: BoxShape.circle),
                      todayTextStyle: TextStyle(color: MyColor.appTheme)),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyles.appbarTextStyle
                        .copyWith(color: MyColor.textColor),
                    leftChevronIcon: customIcon(iconPath: IconPath.leftTabIcon),
                    rightChevronIcon:
                        customIcon(iconPath: IconPath.rightTabIcon),
                    headerMargin: EdgeInsets.all(0),
                    // leftChevronMargin: EdgeInsets.only(left: Sizes.WIDTH_70),
                    // rightChevronMargin: EdgeInsets.only(right: Sizes.WIDTH_70),
                    // leftChevronPadding: EdgeInsets.all(0),
                    // rightChevronPadding: EdgeInsets.all(0),
                  ),
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
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
                            Icon(Icons.calendar_today),
                            const SpaceW8(),
                            Text(_selectedDate.toDialogDate()),
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
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              const SpaceW12(),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, _selectedDate);
                                },
                                child: Text('Save'),
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

  Widget customButton(
      {required void Function()? onPressed,
      required String buttonText,
      ButtonStyle? style,
      Color? textColor}) {
    return SizedBox(
      width: screenWidth / 2.5,
      child: ElevatedButton(
          style: style,
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyles.dateTextStyle.copyWith(color: textColor),
          )),
    );
  }

  Widget customIcon({required String iconPath}) {
    return IconButton(
      icon: Image.asset(iconPath,
          height: Sizes.WIDTH_14,
          width: Sizes.WIDTH_14,
          color: MyColor.textHintColor),
      onPressed: null,
    );
  }
}
