// ignore_for_file: sized_box_for_whitespace

import 'package:black_box/const/const.dart';
import 'package:flutter/material.dart';


void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حول البرنامج', textAlign: TextAlign.right,),
          content:  Container(
            height: 75,
            child: const Column(
              children: [
              Text('المطور: TMC', textAlign: TextAlign.right,),
              SizedBox(height: 5,),
              Text('الاصدار: 0.0.1', textAlign: TextAlign.right,),
              // SizedBox(height: 5,),
              // Text('Company: TMC.'),
              // SizedBox(height: 5,),
              //belowzero_1_35703
            ]
        ),
      ),
          actions: <Widget>
        [
          TextButton
          (
            child: Text('متابعة', textAlign: TextAlign.right, style: TextStyle(color: Specs().cBlack),),
            onPressed: () {Navigator.of(context).pop();},
          ),
        ],
      );
    },
  );
  }

// class ListItems extends StatelessWidget {
//   const ListItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: ListView(
//             padding: const EdgeInsets.all(8),
//             children: [
//               InkWell(
//                 onTap: () {
//                 },
//                 child: Container(
//                   height: 50,
//                   color: Colors.amber[100],
//                   child: const Center(child: Text('Entry A')),
//                 ),
//               ),
//               const Divider(),
//               Container(
//                 height: 50,
//                 color: Colors.amber[200],
//                 child: const Center(child: Text('Entry B')),
//               ),
//               const Divider(),
//               Container(
//                 height: 50,
//                 color: Colors.amber[300],
//                 child: const Center(child: Text('Entry C')),
//               ),
//             ],
//           ),
//       ),
//     );
//   }
// }

// class ItemsMenu extends StatelessWidget {
//   const ItemsMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               //1
//               Container(
//                 height: 20,
//                 //width: 100,
//                 child: const Text("Developer: Shadow Company",
//                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
//               ),
//               const SizedBox(height: 10,),
//               //2
//               Container(
//                 height: 20,
//                 //width: 100,
//                 child: const Text("Version: 0.0.1",
//                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
//               ),
//               const SizedBox(height: 10,),
//               //3
//               Container(
//                 height: 20,
//                 //width: 100,
//                 child: const Text("Company: TMC",
//                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ItemsMenu extends StatelessWidget {
//   const ItemsMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               PopupMenuButton<String>(
//                 onSelected: (String result) {},
//                 itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//                   const PopupMenuItem<String>(
//                     value: 'Option  1',
//                     child: Text('Option  1'),
//                   ),
//                   const PopupMenuItem<String>(
//                     value: 'Option  2',
//                     child: Text('Option  2'),
//                   ),
//                   const PopupMenuItem<String>(
//                     value: 'Option  3',
//                     child: Text('Option  3'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }