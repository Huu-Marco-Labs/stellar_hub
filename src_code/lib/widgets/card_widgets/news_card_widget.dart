import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/common_models/news_model.dart';
import '../../utilities/constants.dart';
import 'package:get/get.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel news;
  const NewsCardWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Image.network(
              news.imageUrl,
              width: 637.w,
              height: AppConstants.halfScreenHeight,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultMargin * 1.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCardButton(
                    Icon(
                      Icons.arrow_back,
                      size: 24.w,
                    ),
                  ),
                  SizedBox(width: kSizedBox * 15),
                  iconCardButton(
                    Icon(
                      Icons.favorite_outline,
                      color: kPrimaryColor,
                      size: 24.w,
                    ),
                  ),
                  iconCardButton(
                    Icon(
                      Icons.file_upload_outlined,
                      color: kPrimaryColor,
                      size: 24.w,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppConstants.halfScreenHeight - 25),
              padding: EdgeInsets.all(kDefaultPadding * 4),
              width: double.infinity,
              height: 600.h,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  topRight: Radius.circular(kBorderRadius),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    news.title,
                    maxLines: 4,
                    style: kBoldText(32.sp, kFreudFont),
                  ),
                  SizedBox(height: kSizedBox),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.newsSite,
                        style: kLowWeightText(
                          15.sp,
                          kFreudFont,
                        ),
                      ),
                      Text(
                        news.formattedPublishedDate,
                        style: kLowWeightText(
                          15.sp,
                          kFreudFont,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kSizedBox * 2),
                  Text(
                    news.summary,
                    maxLines: 10,
                    style: kDefaultText(15.sp, kFreudFont),
                  ),
                  SizedBox(height: kSizedBoxEnd),
                  Text(
                    'Wish if i can show you more details but that\'s all what I\'m getting from this api ( I\'m broke help )',
                    maxLines: 2,
                    style: kDefaultText(15.sp, kFreudFont),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton iconCardButton(Icon icon) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: icon,
    );
  }
}
