import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});
  static const String interestScreenRoute = '/interest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Container(
        margin: EdgeInsets.only(
          top: kDefaultPadding * 18,
          left: kDefaultPadding * 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help us',
              style: kDefaultText(
                20.sp,
                kFreudFont,
              ),
            ),
            Text(
              'PERSONALIZE\nYOUR CONTENT',
              style: kDefaultText(30.sp, kSpaceFont),
            ),
            SizedBox(height: kDefaultPadding),
            Text(
              'Pick all the topics that\ninterest you and your\n"Today" page will show the\ncontent you want to see',
              style: kDefaultText(
                15.sp,
                kFreudFont,
              ),
            ),
            SizedBox(height: kDefaultPadding * 2),
            Container(
              padding: EdgeInsets.all(kDefaultPadding * 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0.w,
                  color: kPrimaryColor,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('item been picked');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                ),
                child: Text(
                  'Missions',
                  style: kDefaultText(20.sp, kFreudFont),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
