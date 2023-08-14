import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/test_model.dart';
import '../constants.dart';
import '../widgets/app_bar_widgets/sliver_app_bar_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const String exploreScreenRoute = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                sliverAppBarWidget('EXPLORE', 'The Universe'),
              ];
            },
            body: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      width: 80.w,
                      height: 80.h,
                      child: ListView.builder(
                          itemCount: exploreItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(23)),
                                  border: Border.all(color: kPrimaryColor)),
                              child: Text(
                                exploreItems[index],
                                style: kDefaultText(kBigText, kFreudFont),
                              ),
                            );
                          }),
                    ),
                  ),
                ])
              ],
            )));
  }
}
