import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stellarhub/models/test_model.dart';
import 'package:stellarhub/widgets/list_view_widget.dart';
import '../constants.dart';
import '../widgets/header_widgets/title_header_widget.dart';

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
                SliverAppBar(
                  backgroundColor: kSecondaryColor,
                  toolbarHeight: 100.h,
                  title: titleHeaderWidget(),
                )
              ];
            },
            body: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 80.w,
                      height: 80.h,
                      child: ListView.builder(
                          itemCount: exploreItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
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
