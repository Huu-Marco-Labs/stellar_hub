import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stellarhub/constants.dart';

import '../../models/space_news.model.dart';

class NewsListWidget extends StatelessWidget {
  final List<SpaceNews> newsList;
  const NewsListWidget({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
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
                top: 90.h,
                bottom: 6.h,
                child: SizedBox(
                  width: 200.w,
                  child: Text(
                    newsList[index].title,
                    overflow: TextOverflow.ellipsis,
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
