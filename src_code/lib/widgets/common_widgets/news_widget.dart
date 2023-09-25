import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/card_widgets/news_card_widget.dart';
import '../../controller/common_controllers/news_controller.dart';
import '../../models/common_models/news_model.dart';
import '../../utilities/constants.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController spaceNewsController = Get.find();

    return Obx(() {
      if (spaceNewsController.spaceNewsList.isEmpty) {
        spaceNewsController.fetchSpaceNews();
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        );
      } else if (spaceNewsController.spaceNewsList.isNotEmpty) {
        return NewsListWidget(newsList: spaceNewsController.spaceNewsList);
      } else {
        return const Text('No data available');
      }
    });
  }
}

class NewsListWidget extends StatelessWidget {
  final List<NewsModel> newsList;
  const NewsListWidget({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final NewsModel news = newsList[index];
          return GestureDetector(
            onTap: () {
              Get.to(NewsCardWidget(
                news: news,
              ));
            },
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        child: Image.network(
                          newsList[index].imageUrl,
                          width: 305.w,
                          height: 120.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 29.w,
                  top: 80.h,
                  bottom: 6.h,
                  child: SizedBox(
                    width: 200.w,
                    child: Text(
                      newsList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: kBoldText(
                        12.sp,
                        kFreudFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
