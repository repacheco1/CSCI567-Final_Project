import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class ExpirationDateField extends StatelessWidget {
  final format = DateFormat("MM-dd-yyyy");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Expiration Date:'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(2020),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2050));
        },
      ),
    ]);
  }
}