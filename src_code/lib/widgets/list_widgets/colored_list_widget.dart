import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';

Row coloredListWidget(List<String> images, double height,
    {double? right = 0.1}) {
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
                    right: right! * height,
                    left: 0 * height,
                    bottom: 0 * height,
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      child: Center(
                        child: Text(
                          'title will be here\nmore text',
                          textAlign: TextAlign.center,
                          style: kBoldText(
                            12.sp,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
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
