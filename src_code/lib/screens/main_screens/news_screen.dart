import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/header_widgets/list_header_widget.dart';

import '../../utilities/constants.dart';
import '../../controller/clock_controller.dart';
import '../../models/test_model.dart';
import '../../widgets/app_bar_widgets/sliver_app_bar_widget.dart';
import '../../widgets/clock_widget.dart';
import '../../widgets/list_widgets/list_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  static const String newsScreenRoute = '/news';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ClockController clockController = Get.put(ClockController());

  @override
  void dispose() {
    Get.delete<ClockController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBarWidget(
              title: 'News',
              subTitle: 'Stay updated',
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultMargin),
            child: Column(
              children: [
                const ClockWidget(),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(
                  title: 'Breaking News',
                ),
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
                const ListHeaderWidget(title: 'Top Stories'),
                SizedBox(height: kSizedBox),
                storyListWidget(images5, 178.h),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(title: 'Trending'),
                SizedBox(height: kSizedBox),
                listWidget(images1, 178.h),
                SizedBox(height: kSizedBoxEnd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row storyListWidget(List<String> images1, double height) {
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      maxLines: 3,
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
