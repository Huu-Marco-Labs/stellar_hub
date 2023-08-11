import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

Row listViewWidget(List<String> images1, double height) {
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
                      images1[index],
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
