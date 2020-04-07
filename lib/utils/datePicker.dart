import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class ExpirationDateField extends StatelessWidget {
  final format = DateFormat('yMMMMd');
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Expiration Date:',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      DateTimeField(
        decoration: new InputDecoration(
          hintText: 'eg. ${DateFormat.yMMMMd().format(DateTime.now())}',
        ),
        style: TextStyle(
          fontSize: 18,
        ),
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