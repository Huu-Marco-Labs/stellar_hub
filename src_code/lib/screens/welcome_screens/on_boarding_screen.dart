import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import '../../widgets/navigation_bar_widget.dart';
import '../../constants.dart';
import '../../models/on_boarding_model.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String onBoardingScreen = '/onBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onBoardingBox = Hive.box<bool>('onboarding');
    final bool? isOnBoardingCompleted =
        onBoardingBox.get('completed', defaultValue: false);
    if (isOnBoardingCompleted!) {
      return NavigationBarWidget();
    } else {
      return Scaffold(
        body: PageView.builder(
          controller: _controller,
          itemCount: 3,
          onPageChanged: (int index) {
            currentIndex = index;
          },
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () async {
                if (currentIndex == contents.length - 1) {
                  final onboardingBox = Hive.box<bool>('onboarding');
                  onboardingBox.put('completed', true);
                  Get.offAllNamed(NavigationBarWidget.navigationBarWidget);
                }
                _controller.nextPage(
                  duration: const Duration(microseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              child: Scaffold(
                backgroundColor: kSecondaryColor,
                body: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(contents[i].image),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100.h, left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contents[i].header,
                            style: kDefaultText(20.sp, kSpaceFont),
                          ),
                          Text(
                            contents[i].title,
                            style: kDefaultText(30.sp, kSpaceFont),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            contents[i].description,
                            style: kDefaultText(15.sp, kSpaceFont),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: List.generate(
                              contents.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      width: currentIndex == index ? 35.w : 10.w,
      height: 10.h,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
