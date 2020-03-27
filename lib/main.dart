import 'package:aadhar_validator_example/homepage.dart';
import 'package:flutter/material.dart';
import 'package:aadhar_validator/aadhar_validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aadhar Number Validator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: MyHomePage(title: 'Aadhar Card Validator'),
      home: HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String aadharNumber = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 250,
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 obscureText: true,
//                 onChanged: (String str) {
//                   setState(() {
//                     aadharNumber = str;
//                   });
//                 },
//                 decoration:
//                     InputDecoration(labelText: 'Start typing to validate...'),
//                     maxLength: 12,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             aadharNumber.length < 12
//                 ? Text("Please enter 12 characters")
//                 : AadharValidator.validateAadhar(aadharNumber: aadharNumber)
//                     ? Text(
//                         'The Aadhar number is valid.',
//                         style: TextStyle(color: Colors.green),
//                       )
//                     : Text(
//                         'The Aadhar number is invalid.',
//                         style: TextStyle(color: Colors.red),
//                       )
//           ],
//         ),
//       ),
//     );
//   }
// }
