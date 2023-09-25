import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../widgets/tweet_widget.dart';
import '../../models/tweet_model.dart';
import '../../widgets/common_widgets/image_nasa_widget.dart';
import '../../widgets/common_widgets/video_widget.dart';
import '../../widgets/common_widgets/news_widget.dart';
import '../../utilities/constants.dart';
import 'setting_screen.dart';
import '../../widgets/header_widgets/list_header_widget.dart';
import '../../widgets/header_widgets/view_all_header_widget.dart';
import '../../services/tweet_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String homeScreenRoute = '/home';

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMMM d').format(currentDate);

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kSecondaryColor,
              toolbarHeight: 100.h,
              actions: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * 3.5),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(SettingScreen.settingScreenRoute);
                    },
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ),
              ],
              title: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TODAY',
                      style: kDefaultText(30.sp, kSpaceFont),
                    ),
                    Text(
                      formattedDate,
                      style: kLowWeightText(18.sp, kFreudFont),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.7),
            child: Column(
              children: [
                SizedBox(height: kSizedBox),
                const ViewAllHeaderWidget(title: 'News', index: 1),
                SizedBox(height: kSizedBox),
                const NewsWidget(),
                SizedBox(height: kSizedBox),
                const ViewAllHeaderWidget(title: 'Images of the Day', index: 3),
                SizedBox(height: kSizedBox),
                const ImageNasaWidget(),
                SizedBox(height: kSizedBox),
                const ViewAllHeaderWidget(title: 'Videos of the Day', index: 3),
                SizedBox(height: kSizedBox),
                const VideoWidget(),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(title: 'Recent Tweets'),
                SizedBox(height: kSizedBox),
                FutureBuilder<List<TweetModel>>(
                  future: TweetService().getLatestNasaTweets(5),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No tweets available.');
                    } else {
                      final tweets = snapshot.data!;
                      return TweetWidget(tweets: tweets);
                    }
                  },
                ),
                SizedBox(height: kSizedBoxEnd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
