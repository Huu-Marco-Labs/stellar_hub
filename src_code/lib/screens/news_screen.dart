import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/list_view_widget.dart';
import '../models/test_model.dart';
import '../widgets/clock_widgets/clock_widget.dart';
import '../widgets/story_list_widget.dart';
import '../constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/header_widgets/list_header_widget.dart';

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
              clockWidget(),
              SizedBox(height: kSizedBox),
              listHeaderWidget('Breaking News'),
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
              listHeaderWidget('Top Stories'),
              SizedBox(height: kSizedBox),
              storyListWidget(images5, 178.h),
              SizedBox(height: kSizedBox),
              listHeaderWidget('Trending'),
              SizedBox(height: kSizedBox),
              listViewWidget(images1, 178.h),
            ],
          ),
        ),
      ),
    );
  }
}
