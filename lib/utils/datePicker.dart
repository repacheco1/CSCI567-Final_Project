import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class ExpirationDateField {
  final format = DateFormat('yyyy-MM-dd');
  Widget build(BuildContext context, TextEditingController input) {
    return Column(children: <Widget>[
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
              firstDate: DateTime(2020),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2050));
        },
      ),
    ]);
  }
}