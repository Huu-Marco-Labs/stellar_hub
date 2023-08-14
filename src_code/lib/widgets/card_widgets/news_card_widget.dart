import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import 'package:get/get.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/test.png',
              width: 637.w,
              height: AppConstants.halfScreenHeight,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultMargin * 1.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCardButton(
                    Icon(
                      Icons.arrow_back,
                      size: 24.w,
                    ),
                  ),
                  SizedBox(width: kSizedBox * 15),
                  iconCardButton(
                    Icon(
                      Icons.favorite_outline,
                      color: kPrimaryColor,
                      size: 24.w,
                    ),
                  ),
                  iconCardButton(
                    Icon(
                      Icons.file_upload_outlined,
                      color: kPrimaryColor,
                      size: 24.w,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppConstants.halfScreenHeight - 25),
              padding: EdgeInsets.all(kDefaultPadding * 4),
              width: double.infinity,
              height: 600.h,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  topRight: Radius.circular(kBorderRadius),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'NASA approves\nheliophysics\nMissions to Explore\nSun, Earth\'s Aurora',
                    style: kBoldText(32.sp, kFreudFont),
                  ),
                  SizedBox(height: kSizedBox),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'NASA Goddard',
                        style: kLowWeightText(
                          15.sp,
                          kFreudFont,
                        ),
                      ),
                      SizedBox(width: kSizedBox * 5),
                      Text(
                        '1h ago',
                        style: kLowWeightText(
                          15.sp,
                          kFreudFont,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: kSizedBox),
                  const Text('data'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton iconCardButton(Icon icon) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: icon,
    );
  }
}
