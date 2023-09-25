import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stellarhub/controller/common_controllers/image_nasa_controller.dart';
import 'package:stellarhub/controller/common_controllers/video_controller.dart';
import '../controller/common_controllers/news_controller.dart';
import 'controller/index_controllers/nav_index_controller.dart';
import 'screens/welcome_screens/interest_screen.dart';
import 'screens/main_screens/explore_screen.dart';
import 'screens/main_screens/home_screen.dart';
import 'screens/main_screens/media_screen.dart';
import 'screens/main_screens/news_screen.dart';
import 'screens/welcome_screens/on_boarding_screen.dart';
import 'screens/search_screens/search_screen.dart';
import 'screens/main_screens/setting_screen.dart';
import '../widgets/navigation_bar_widget.dart';
import 'screens/welcome_screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 1));
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('onboarding');
  Get.put<NavIndexController>(NavIndexController());
  Get.put<NewsController>(NewsController());
  Get.put<ImageNasaController>(ImageNasaController());
  Get.put<VideoController>(VideoController());
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.splashScreenRoute,
          getPages: [
            GetPage(
              name: SplashScreen.splashScreenRoute,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: OnBoardingScreen.onBoardingScreen,
              page: () => const OnBoardingScreen(),
            ),
            GetPage(
              name: InterestScreen.interestScreenRoute,
              page: () => const InterestScreen(),
            ),
            GetPage(
              name: NavigationBarWidget.navigationBarWidget,
              page: () => NavigationBarWidget(),
            ),
            GetPage(
              name: HomeScreen.homeScreenRoute,
              page: () => const HomeScreen(),
            ),
            GetPage(
              name: NewsScreen.newsScreenRoute,
              page: () => const NewsScreen(),
            ),
            GetPage(
              name: SearchScreen.searchScreenRoute,
              page: () => const SearchScreen(),
            ),
            GetPage(
              name: MediaScreen.mediaScreenRoute,
              page: () => const MediaScreen(),
            ),
            GetPage(
              name: ExploreScreen.exploreScreenRoute,
              page: () => const ExploreScreen(),
            ),
            GetPage(
              name: SettingScreen.settingScreenRoute,
              page: () => const SettingScreen(),
            ),
          ],
        );
      },
    );
  }
}
