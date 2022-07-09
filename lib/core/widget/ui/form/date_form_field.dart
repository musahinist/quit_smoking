import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../util/show_overlay.dart';
import 'input_mask.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    Key? key,
    this.initialValue,
    required this.label,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  final DateTime? initialValue;
  final String label;
  final ValueSetter<DateTime> onChanged;
  final String? Function(String?)? validator;
  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: DateFormat("MM/dd/yyyy HH:mm").format(widget.initialValue ?? date),
    );
  }

  DateTime date = DateTime.now();

  @override
  void dispose() {
    controller.clear();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      inputFormatters: [DateInputFormatter()],
      validator: widget.validator,
      readOnly: true,
      decoration: InputDecoration(
        label: Text(widget.label),
        hintText: "MM/dd/yyyy HH:mm",
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () async {
            date =
                await Show.cupertinoDatePickerModal(context) ?? DateTime.now();
            controller.text = DateFormat("MM/dd/yyyy HH:mm").format(date);
            widget.onChanged.call(date);
          },
        ),
      ),
      onChanged: (String value) {
        widget.onChanged.call(date);
        // if (value.isEmpty) {
        //   widget.onChanged?.call(null);
        // } else {
        //   widget.onChanged?.call(DateTime.tryParse(value)!);
        // }
      },
    );
  }
}
