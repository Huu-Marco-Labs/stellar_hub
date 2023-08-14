// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../constants.dart';
//
// Row coloredListWidget(List<String> images, double height) {
//   return Row(
//     children: [
//       Expanded(
//         child: SizedBox(
//           height: height,
//           child: ListView.builder(
//             itemCount: 3,
//             shrinkWrap: true,
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Stack(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(right: kDefaultPadding + 3),
//                     child: Image.asset(
//                       images[index],
//                     ),
//                   ),
//                   Positioned(
//                     left: 0.w,
//                     bottom: 0.h,
//                     child: Container(
//                       width: 139.w,
//                       height: 49.h,
//                       decoration: BoxDecoration(
//                         color: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(kBorderRadius),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'title will be here\nmore text',
//                           textAlign: TextAlign.center,
//                           style: kBoldText(
//                             12.sp,
//                             kFreudFont,
//                             color: kSecondaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     ],
//   );
// }
