import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

final format = DateFormat('yyyy-MM-dd');
  
Widget expDatePicker(BuildContext context, TextEditingController input) {
  return Column(
    children: <Widget>[
      Text(
        'Expiration Date:',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      DateTimeField(
        decoration: new InputDecoration(
          hintText: 'eg. ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
        ),
        style: TextStyle(
          fontSize: 18,
        ),
        controller: input,
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            
              context: context,
              firstDate: DateTime(DateTime.now().year),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 20));
        },
      ),
    ]
  );
}