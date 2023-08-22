import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../models/test_model.dart';
import '../../widgets/app_bar_widgets/app_bar_widget.dart';
import '../../widgets/header_widgets/list_header_widget.dart';
import '../../widgets/list_widgets/colored_list_widget.dart';
import '../../widgets/search_widgets/image_search_card.dart';
import '../../widgets/search_widgets/mission_search_card.dart';
import '../../widgets/search_widgets/search_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String searchScreenRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: appBarWidget('SEARCH'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
        child: Column(
          children: [
            searchBarWidget(context),
            SizedBox(height: kSizedBox),
            listHeaderWidget('Recent'),
            SizedBox(height: kSizedBox),
            coloredListWidget(images8, 145.h),
            SizedBox(height: kSizedBox),
            listHeaderWidget('Popular'),
            SizedBox(height: kSizedBox),
            imageSearchCard(),
            SizedBox(height: kSizedBox),
            imageSearchCard(),
            SizedBox(height: kSizedBox),
            missionSearchCard(),
          ],
        ),
      ),
    );
  }
}
