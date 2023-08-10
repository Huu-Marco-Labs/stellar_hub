import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../screens/on_boarding_screen.dart';
import '../constants.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const splashScreenRoute = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        Get.offAllNamed(OnBoardingScreen.onBoardingScreen);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/jup.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 110.h, right: 20.w),
            width: double.infinity,
            height: double.infinity,
            child: buildRotatingImage(),
          ),
          Center(
            child: Text(
              'NASA',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 100.sp,
                fontFamily: kSpaceFont,
              ),
            ).animate().fade(
                  begin: .1,
                  end: 1.0,
                  duration: const Duration(seconds: 1),
                ),
          ),
        ],
      ),
    );
  }

  Widget buildRotatingImage() {
    return GetBuilder<SplashController>(
      builder: (controller) {
        double currentRotation = controller.getCurrentRotation();
        return Transform.rotate(
          angle: currentRotation * 3.14 / 180,
          child: Image.asset(
            'assets/images/jup_details.png',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
