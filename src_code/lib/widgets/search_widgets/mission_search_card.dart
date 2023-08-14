import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

Row missionSearchCard() {
  return Row(
    children: [
      Expanded(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/artemis.png',
              width: 233.w,
              height: 145.h,
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 150.w,
                height: 145.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mission',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          '2d ago',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSizedBox),
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPadding * 3),
                      child: Text(
                        'Artemis\nLaunch\nProgram',
                        style: kBoldText(
                          kSmallText,
                          kFreudFont,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
