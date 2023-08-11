import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stellarhub/widgets/list_view_widget.dart';
import '../models/test_model.dart';
import '../widgets/story_list_widget.dart';
import '../constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/clock_column_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static const String newsScreenRoute = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: appBarWidget('NEWS', 'Stay updated'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: Column(
            children: [
              Container(
                height: 74.h,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        clockColumnWidget('02:', 'hours', 50.sp),
                        clockColumnWidget('34:', 'mins', 50.sp),
                        clockColumnWidget('51', 'secs', 50.sp)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'to launch',
                          style: TextStyle(
                            fontSize: kSmallText,
                            fontFamily: kFreudFont,
                          ),
                        ),
                        Text(
                          'SpaceX',
                          style: TextStyle(
                            fontSize: kBigText,
                            fontFamily: kFreudFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSizedBox),
              headerWidget('Breaking News'),
              SizedBox(height: kSizedBox),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      images1[1],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: kSizedBox),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'NASA has approved two heliophysics\nmissions to explore the Sun and the system\nthat drives space weather near Earth...',
                          style: kDefaultText(
                            12.sp,
                            kFreudFont,
                          ),
                        ),
                        Text(
                          '1h ago',
                          style: kDefaultText(
                            12.sp,
                            kFreudFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: kSizedBox),
              headerWidget('Top Stories'),
              SizedBox(height: kSizedBox),
              storyListWidget(images5, 178.h),
              SizedBox(height: kSizedBox),
              headerWidget('Trending'),
              SizedBox(height: kSizedBox),
              listViewWidget(images1, 178.h),
            ],
          ),
        ),
      ),
    );
  }
}
