import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stellarhub/models/test_model.dart';
import 'package:stellarhub/widgets/list_widgets/colored_list_widget.dart';

import '../constants.dart';
import '../controller/index_controllers/filter_index_controller.dart';
import '../widgets/app_bar_widgets/sliver_app_bar_widget.dart';
import '../widgets/header_widgets/view_all_header_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const String exploreScreenRoute = '/explore';

  @override
  Widget build(BuildContext context) {
    FilterIndexController filterIndexController =
        Get.put(FilterIndexController());
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            sliverAppBarWidget('EXPLORE', 'The Universe'),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
          child: Column(
            children: [
              SizedBox(
                height: 52.h,
                child: Expanded(
                  flex: 0,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            filterIndexController.selectedIndex.value = index;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 5.w, 0, 0, 0),
                            height: 2.h,
                            decoration: BoxDecoration(
                                color: index ==
                                        filterIndexController
                                            .selectedIndex.value
                                    ? kPrimaryColor
                                    : kSecondaryColor,
                                borderRadius: BorderRadius.circular(index ==
                                        filterIndexController
                                            .selectedIndex.value
                                    ? 18
                                    : 15),
                                border: Border.all(
                                    color: kPrimaryColor, width: 2.w)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                              child: Center(
                                child: Text(
                                  filterIndexController.exploreItems[index],
                                  style: kDefaultText(20.sp, kFreudFont,
                                      color: index ==
                                              filterIndexController
                                                  .selectedIndex
                                                  .toInt()
                                          ? kSecondaryColor
                                          : kPrimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: kSizedBox),
              viewAllHeaderWidget('On- Going Missions'),
              coloredListWidget(images9, 145.h),
              SizedBox(height: kSizedBox),
              viewAllHeaderWidget('Alphabetically'),
              exploreGridWidget(),
              SizedBox(height: kSizedBox),
              viewAllHeaderWidget('Schedule'),
              Column(
                children: List.generate(
                  2,
                  (index) {
                    return Container(
                      margin: EdgeInsets.only(top: index == 0 ? 0 : 10.h),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(23.w)),
                      height: 65.h,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 22.w, top: 12.w),
                                child: Text(
                                  "February 14, 2021",
                                  style: kLowWeightText(12.sp, kFreudFont,
                                      color: kSecondaryColor),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 24.w, top: 12.w),
                                child: Text(
                                  "11:45 PM EST",
                                  style: kLowWeightText(12.sp, kFreudFont,
                                      color: kSecondaryColor),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 22.w, top: 5.w),
                                child: Text(
                                  "Mission Russian Progress 77",
                                  style: kBoldText(15.sp, kFreudFont,
                                      color: kSecondaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox exploreGridWidget() {
    return SizedBox(
      height: 188.h,
      width: 378.w,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 10.h,
          childAspectRatio: 1 / 3,
        ),
        itemCount: 9, // Total number of items
        itemBuilder: (context, index) {
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.w),
                  color: kPrimaryColor),
            ),
            Row(
              children: [
                Image.asset(images10[index]),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    text1[index],
                    style: kBoldText(15.sp, kFreudFont, color: kSecondaryColor),
                  ),
                ),
              ],
            )
          ]);
        },
      ),
    );
  }
}
