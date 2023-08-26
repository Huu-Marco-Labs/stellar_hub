import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/index_controllers/nav_index_controller.dart';
import '../screens/explore_screen.dart';
import '../screens/home_screen.dart';
import '../screens/media_screen.dart';
import '../screens/news_screen.dart';
import '../screens/search_screens/search_screen.dart';
import 'icon_widgets/circular_icon_widget.dart';

class NavigationBarWidget extends StatefulWidget {
  static const String navigationBarWidget = '/navigationBar';
  NavigationBarWidget({super.key});
  final NavIndexController indexController = Get.find();

  @override
  NavigationBarWidgetState createState() => NavigationBarWidgetState();
}

class NavigationBarWidgetState extends State<NavigationBarWidget> {
  final List<Widget> _pages = [
    HomeScreen(),
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
                          icon: CircularIconWidget(
                            iconData: Icons.calendar_today_outlined,
                            isSelected:
                                widget.indexController.currentPageIndex.value ==
                                    0,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircularIconWidget(
                            iconData: Icons.article_outlined,
                            isSelected:
                                widget.indexController.currentPageIndex.value ==
                                    1,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircularIconWidget(
                            iconData: Icons.search_outlined,
                            isSelected:
                                widget.indexController.currentPageIndex.value ==
                                    2,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircularIconWidget(
                            iconData: Icons.perm_media_outlined,
                            isSelected:
                                widget.indexController.currentPageIndex.value ==
                                    3,
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: CircularIconWidget(
                            iconData: Icons.explore_outlined,
                            isSelected:
                                widget.indexController.currentPageIndex.value ==
                                    4,
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
