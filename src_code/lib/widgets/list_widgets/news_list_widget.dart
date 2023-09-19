import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilities/constants.dart';

import '../../models/home_screen_models/space_news.model.dart';

class NewsListWidget extends StatelessWidget {
  final List<SpaceNews> newsList;
  const NewsListWidget({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
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
          );
        },
      ),
    );
  }
}
