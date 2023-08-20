import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/index_controllers/filter_index_controller.dart';
import '../models/test_model.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../widgets/app_bar_widgets/sliver_app_bar_widget.dart';

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
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            sliverAppBarWidget('EXPLORE', 'The Universe'),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
          child: Column(
            children: [
              Expanded(
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
                          duration: const Duration(microseconds: 300),
                          margin:
                              EdgeInsets.fromLTRB(index == 0 ? 15 : 5, 0, 5, 0),
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: index ==
                                    filterIndexController.selectedIndex.value
                                ? kPrimaryColor
                                : kSecondaryColor,
                            borderRadius: BorderRadius.circular(index ==
                                    filterIndexController.selectedIndex.value
                                ? 18
                                : 15),
                          ),
                          child: Text(
                            'data',
                            style: kLowWeightText(13.sp, kFreudFont),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: kSizedBoxEnd * 4.5),
            ],
          ),
        ),
      ),
    );
  }
}
