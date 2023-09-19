import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stellarhub/screens/search_screens/search_delegate_screen.dart';
import 'package:stellarhub/widgets/header_widgets/list_header_widget.dart';

import '../../utilities/constants.dart';
import '../../models/test_model.dart';
import '../../widgets/list_widgets/colored_list_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String searchScreenRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Container(
          margin: EdgeInsets.only(top: kDefaultMargin),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
          child: Text(
            'SEARCH',
            style: kDefaultText(30.sp, kSpaceFont),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
        child: Column(
          children: [
            searchBarWidget(context),
            SizedBox(height: kSizedBox),
            const ListHeaderWidget(title: 'Recent'),
            SizedBox(height: kSizedBox),
            ColoredListWidget(images: images8, height: 145.h),
            SizedBox(height: kSizedBox),
            const ListHeaderWidget(title: 'Popular'),
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

Row imageSearchCard() {
  return Row(
    children: [
      Expanded(
        child: Stack(
          children: [
            SizedBox(
              height: 105.h,
              width: 120.w,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  'assets/images/idk.png',
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 275.w,
                height: 104.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Image',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          '2d ago',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSizedBox),
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPadding * 9),
                      child: Text(
                        'Lunar Halo over\nSnowy Trees',
                        style: kBoldText(
                          kSmallText,
                          kFreudFont,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Row missionSearchCard() {
  return Row(
    children: [
      Expanded(
        child: Stack(
          children: [
            SizedBox(
              height: 145.h,
              width: 180.w,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  'assets/images/artemis.png',
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 220.w,
                height: 125.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mission',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                        Text(
                          '2d ago',
                          style: kDefaultText(
                            kSmallText - 3,
                            kFreudFont,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSizedBox),
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPadding * 3),
                      child: Text(
                        'Artemis\nLaunch\nProgram',
                        style: kBoldText(
                          kSmallText,
                          kFreudFont,
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Row searchBarWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 308.w,
        height: 43.h,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
          border: Border.all(
            color: kPrimaryColor,
            width: 2.w,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchDelegateScreen(),
            );
          },
          child: Row(
            children: [
              SizedBox(width: kSizedBox),
              Icon(
                Icons.search,
                color: kPrimaryColor,
                size: 24.w,
              ),
              SizedBox(width: kSizedBox),
              Text(
                'Search the intergalactic space',
                style: kLowWeightText(kSmallText - 3, kFreudFont),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          if (kDebugMode) {
            print('Mic works!');
          }
        },
        icon: const Icon(
          Icons.mic_none_outlined,
          color: kPrimaryColor,
        ),
      ),
    ],
  );
}
