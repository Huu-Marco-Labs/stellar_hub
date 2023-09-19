import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/header_widgets/list_header_widget.dart';
import '../../widgets/list_widgets/colored_list_widget.dart';
import '../../models/test_model.dart';
import '../../widgets/list_widgets/list_widget.dart';
import '../../widgets/header_widgets/view_all_header_widget.dart';
import '../../widgets/app_bar_widgets/sliver_app_bar_widget.dart';

import '../../utilities/constants.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});
  static const String mediaScreenRoute = '/media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBarWidget(
                title: 'MEDIA', subTitle: 'Resource Archive'),
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 4),
            child: Column(
              children: [
                const ViewAllHeaderWidget(title: 'Images', index: 3),
                SizedBox(height: kSizedBox),
                listWidget(images6, 178.h),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(title: 'Categories'),
                SizedBox(height: kSizedBox),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonIconWidget('planet'),
                        buttonIconWidget('moon'),
                        buttonIconWidget('sun'),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonIconWidget('rocket'),
                          buttonIconWidget('world'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buttonIconWidget('star'),
                        buttonIconWidget('space_hut'),
                        buttonIconWidget('atom'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: kSizedBox),
                const ViewAllHeaderWidget(title: 'Videos', index: 2),
                SizedBox(height: kSizedBox),
                ColoredListWidget(images: images7, height: 186.h),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(title: 'NASA TV'),
                SizedBox(height: kSizedBox),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/nasa_tv.png',
                      width: 160.w,
                      height: 160.h,
                    ),
                    Image.asset(
                      'assets/images/nasa_tv.png',
                      width: 160.w,
                      height: 160.h,
                    ),
                  ],
                ),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(title: 'NASA Radio & Podcast'),
                SizedBox(height: kSizedBox),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/nasa_tv.png',
                      width: 160.w,
                      height: 160.h,
                    ),
                    Image.asset(
                      'assets/images/nasa_tv.png',
                      width: 160.w,
                      height: 160.h,
                    ),
                  ],
                ),
                SizedBox(height: kSizedBoxEnd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

GestureDetector buttonIconWidget(String image) {
  return GestureDetector(
    onTap: () {},
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/icons/rectangle.png',
          height: 100.h,
        ),
        Image.asset(
          'assets/images/icons/$image.png',
          height: 60.h,
        ),
      ],
    ),
  );
}
