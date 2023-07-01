// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_application_chuyenman/common/authentication.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 200),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               // ignore: deprecated_member_use
//               primary: const Color(0xff8359E3),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(35),
//               ),
//             ),
//             onPressed: () async {
//               try {
//                 await Auth().logOut();
//                 Navigator.pushNamed(context, "/login");
//               } catch (error) {
//                 // ignore: avoid_print
//                 print(error.toString());
//               }
//             },
//             child: const Text(
//               "Log out",
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
