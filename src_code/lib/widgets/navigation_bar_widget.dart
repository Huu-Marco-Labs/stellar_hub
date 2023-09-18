import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/index_controllers/nav_index_controller.dart';
import '../screens/main_screens/explore_screen.dart';
import '../screens/main_screens/home_screen.dart';
import '../screens/main_screens/media_screen.dart';
import '../screens/main_screens/news_screen.dart';
import '../screens/search_screens/search_screen.dart';

class NavigationBarWidget extends StatefulWidget {
  static const String navigationBarWidget = '/navigationBar';
  NavigationBarWidget({super.key});
  final NavIndexController indexController = Get.find();

  @override
  NavigationBarWidgetState createState() => NavigationBarWidgetState();
}

class NavigationBarWidgetState extends State<NavigationBarWidget> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const NewsScreen(),
    const SearchScreen(),
    const MediaScreen(),
    const ExploreScreen(),
  ];

  void _onItemTapped(int index) {
    widget.indexController.updatePageIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            _pages[widget.indexController.currentPageIndex.value],
            Positioned(
              bottom: 20.h,
              left: 0.w,
              right: 0.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding + 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadius + 7),
                  child: Container(
                    height: 80.w,
                    color: kPrimaryColor,
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      selectedFontSize: 0,
                      backgroundColor: kPrimaryColor,
                      currentIndex:
                          widget.indexController.currentPageIndex.value,
                      onTap: _onItemTapped,
                      items: [
                        BottomNavigationBarItem(
                          icon: circularIconWidget(
                            Icons.calendar_today_outlined,
                            widget.indexController.currentPageIndex.value == 0,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: circularIconWidget(
                            Icons.article_outlined,
                            widget.indexController.currentPageIndex.value == 1,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: circularIconWidget(
                            Icons.search_outlined,
                            widget.indexController.currentPageIndex.value == 2,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: circularIconWidget(
                            Icons.perm_media_outlined,
                            widget.indexController.currentPageIndex.value == 3,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: circularIconWidget(
                            Icons.explore_outlined,
                            widget.indexController.currentPageIndex.value == 4,
                          ),
                          label: '',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget circularIconWidget(IconData iconData, bool isSelected) {
  final Color bgColor = isSelected ? kSecondaryColor : kPrimaryColor;
  final Color iconColor = isSelected ? kPrimaryColor : kSecondaryColor;

  return Center(
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2.0.w,
          color: kSecondaryColor,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: bgColor,
        radius: kBorderRadius,
        child: Icon(
          iconData,
          color: iconColor,
        ),
      ),
    ),
  );
}
