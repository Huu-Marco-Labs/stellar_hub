import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../screens/search_screens/search_delegate_screen.dart';

Row searchBarWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 308.w,
        height: 43.h,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(
            color: kPrimaryColor,
            width: 2.w,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchDelegateScreen(),
            );
          },
          child: Row(
            children: [
              SizedBox(width: kSizedBox),
              Icon(
                Icons.search,
                color: kPrimaryColor,
                size: 24.w,
              ),
              SizedBox(width: kSizedBox),
              Text(
                'Search the intergalactic space',
                style: kLowWeightText(kSmallText - 3, kFreudFont),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          if (kDebugMode) {
            print('Mic works!');
          }
        },
        icon: const Icon(
          Icons.mic_none_outlined,
          color: kPrimaryColor,
        ),
      ),
    ],
  );
}
