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
              scrollCardWidget(),
              SizedBox(height: kSizedBox),
              viewAllHeaderWidget('Schedule'),
              SizedBox(height: kSizedBox),
            ],
          ),
        ),
      ),
    );
  }

  Container scrollCardWidget() {
    return Container(
      height: 188.h,
      width: 378.w,
      child: GridView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 10.w,
        ),
        children: List.generate(9, (index) {
          return Container(
            width: 200.w,
            height: 2.h,
            color: kPrimaryColor,
          );
        }),
      ),
    );
  }
}
