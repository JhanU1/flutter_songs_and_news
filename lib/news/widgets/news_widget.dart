// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

// class NewWidget extends StatelessWidget {
//   const NewWidget({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return   SafeArea(
//       top: false,
//       bottom: false,
//       child: Card(
//         elevation: 1.5,
//         margin: const EdgeInsets.fromLTRB(6, 12, 6, 0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: InkWell(
//           // Make it splash on Android. It would happen automatically if this
//           // was a real card but this is just a demo. Skip the splash on iOS.
//           onTap: defaultTargetPlatform == TargetPlatform.iOS ? null : () {
            
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: colors[index],
//                   child: Text(
//                     titles[index].substring(0, 1),
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const Padding(padding: EdgeInsets.only(left: 16)),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         titles[index],
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const Padding(padding: EdgeInsets.only(top: 8)),
//                       Text(
//                         contents[index],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }