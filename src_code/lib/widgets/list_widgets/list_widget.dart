import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilities/constants.dart';

//TODO: This widget will be deleted later
Row listWidget(List<String> images, double height) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: kDefaultPadding + 3),
                    child: Image.asset(
                      images[index],
                    ),
                  ),
                  Positioned(
                    left: 29.w,
                    bottom: 6.h,
                    child: Text(
                      'title will be here\nmore text',
                      style: kBoldText(12.sp, kFreudFont),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ],
  );
}
