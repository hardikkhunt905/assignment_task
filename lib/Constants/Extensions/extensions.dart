import 'package:intl/intl.dart';

extension DateExt on DateTime {
//intl lib
  // String get dayFormat  => DateFormat('d/MMM/yy').format(this);
  // String get dateFormat => DateFormat('dd/MM/yy').format(this);
  // String get timeFormat => DateFormat('kk: ss  aa').format(this);
}

extension CalendarDateOfTime on DateTime {
  String toDialogDate() {
    String dateTime = DateFormat("dd MMM yyyy").format(this);
    return dateTime;
  }

  String toListViewDate() {
    String dateTime = DateFormat("dd MMM, yyyy").format(this);
    return dateTime;
  }
}