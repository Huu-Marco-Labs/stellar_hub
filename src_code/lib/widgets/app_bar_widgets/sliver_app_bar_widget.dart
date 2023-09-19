import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilities/constants.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const SliverAppBarWidget(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kSecondaryColor,
      toolbarHeight: 100.h,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kDefaultText(30.sp, kSpaceFont),
            ),
            Text(
              subTitle,
              style: kLowWeightText(18.sp, kFreudFont),
            ),
          ],
        ),
      ),
    );
  }
}
