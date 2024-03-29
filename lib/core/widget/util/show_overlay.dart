import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Show {
  static ScaffoldMessengerState snackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }

  // static ScaffoldMessengerState snackBar(String text) {
  //   return scaffoldMessengerKey.currentState!
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(
  //       SnackBar(
  //         content: Text(text),
  //       ),
  //     );
  // }
  static dialog(BuildContext context, Widget child) async {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: child,
      ),
    );
  }

  static Future<DateTime?> cupertinoDatePickerModal(
    BuildContext context,
  ) async {
    DateTime? date;
    FocusScope.of(context).unfocus();
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => SizedBox(
        height: 280,
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.dateAndTime,
          use24hFormat: true,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            date = newDate;
          },
        ),
      ),
    );

    return date;
  }

  static Future<String?> cupertinoYearPickerModal(BuildContext context) async {
    String? year;
    int before = 60;
    int after = 10;
    FocusScope.of(context).unfocus();
    final int thisYear = DateTime.now().year;
    List<int> yearList = List.generate(
        before + 1 + after, (index) => index + (thisYear - before));
    FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: yearList.indexOf(thisYear));
    await showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: CupertinoPicker(
          onSelectedItemChanged: (value) {
            year = yearList[value].toString();
          },
          scrollController: scrollController,
          itemExtent: 32,
          children: yearList.map((year) => Text(year.toString())).toList(),
        ),
      ),
    );

    return year;
  }

  static void bottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      //not ot ovwerlap by keyboard
      isScrollControlled: true,
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Container(
        //   height: 200,
        decoration: const BoxDecoration(
          // color: Colors.blueGrey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          //not ot ovwerlap by keyboard
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.more_horiz, size: 36, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget,
              )
            ],
          ),
        ),
      ),
    );
  }
}
