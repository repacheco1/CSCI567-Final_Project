// import 'package:flutter/material.dart';


// class TypeMenu extends StatelessWidget {
//   String type = 'eg. Cans';
//   final List<String> _dropdownValues = [
//     "Bags",
//     "Bottles",
//     "Boxes",
//     "Cans",
//     "Pieces",
//   ]; 

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text(
//         'Qty Types:',
//         style: TextStyle(
//           fontSize: 18,
//         ),
//       ),
//       DropdownButton(
//       items: _dropdownValues.map((value) => DropdownMenuItem(
//         child: Text(value),
//         value: value,
//       )).toList(),
//       onChanged: (String value){
//         type = value;
//       },
//       hint: Text('$type'),
//     ),
//     ],
//     );
//   }
// }