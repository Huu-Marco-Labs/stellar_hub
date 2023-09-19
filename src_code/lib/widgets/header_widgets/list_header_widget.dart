import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/constants.dart';

class ListHeaderWidget extends StatelessWidget {
  final String title;

  const ListHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: kBoldText(15.sp, kFreudFont),
        ),
      ],
    );
  }
}
