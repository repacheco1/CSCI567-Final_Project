import 'package:flutter/material.dart';

class CustomTextField{
  Widget customTextField(String label, String hint, TextEditingController input, [bool isFocus]){
    var custom = new Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextFormField(
        autofocus: isFocus ?? false, //if isFocus is null, then autofocus is false
        textCapitalization: TextCapitalization.sentences,
        decoration: new InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        style: TextStyle(
          fontSize: 16,
        ),
        controller: input
      ),
    );

    return custom;
  }
  
}
