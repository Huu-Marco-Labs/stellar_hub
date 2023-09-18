import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class ColoredListWidget extends StatelessWidget {
  final List<String> images;
  final double height;

  const ColoredListWidget(
      {super.key, required this.images, required this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: height,
            child: ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 12.w),
                  child: Stack(
                    children: [
                      Image.asset(
                        images[index],
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
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
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
