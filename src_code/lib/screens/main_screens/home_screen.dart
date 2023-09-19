import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../widgets/space_video_widget.dart';
import '../../widgets/list_widgets/news_list_widget.dart';

import '../../services/news_service.dart';
import '../../utilities/constants.dart';
import '../../models/home_screen_models/image_nasa_model.dart';
import '../../models/home_screen_models/space_news.model.dart';
import '../../services/nasa_services/image_nasa_service.dart';
import 'setting_screen.dart';
import '../../widgets/header_widgets/list_header_widget.dart';
import '../../widgets/header_widgets/view_all_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String homeScreenRoute = '/home';

  @override
  Widget build(BuildContext context) {
    final spaceFlightService = NewsService();
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
                news(spaceFlightService),
                SizedBox(height: kSizedBox),
                const ViewAllHeaderWidget(title: 'Images of the Day', index: 3),
                SizedBox(height: kSizedBox),
                imageOfTheDay(),
                SizedBox(height: kSizedBox),
                const ViewAllHeaderWidget(title: 'Videos of the Day', index: 3),
                SizedBox(height: kSizedBox),
                const SpaceVideoWidget(),
                SizedBox(height: kSizedBox),
                const ListHeaderWidget(title: 'Recent Tweets'),
                SizedBox(height: kSizedBox),
                //TODO: Add the twitter api widget here
                Image.asset('assets/images/test4.png'),
                SizedBox(height: kSizedBoxEnd),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<SpaceNews>> news(NewsService spaceFlightService) {
    return FutureBuilder<List<SpaceNews>>(
      future: spaceFlightService.fetchSpaceNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          return NewsListWidget(newsList: snapshot.data!);
        }
      },
    );
  }
}

FutureBuilder<List<ImageNasaModel>> imageOfTheDay() {
  final ImageNasaService imageNasaService = ImageNasaService();

  return FutureBuilder<List<ImageNasaModel>>(
    future: imageNasaService.getLast3ImagesOfTheDay(),
    initialData: const [],
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final images = snapshot.data!;
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 125.h,
                child: ListView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final nasaImage = images[index];
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: kDefaultPadding + 4),
                          child: Image.network(
                            width: 170.w,
                            height: 125.h,
                            nasaImage.hdurl,
                          ),
                        ),
                        Positioned(
                          left: 15.w,
                          bottom: 10.h,
                          child: SizedBox(
                            width: 100.w,
                            child: Text(
                              nasaImage.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: kBoldText(12.sp, kFreudFont),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      } else {
        return const Text('No images available.');
      }
    },
  );
}
