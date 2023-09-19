import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/space_video_service.dart';

import '../models/home_screen_models/space_video_model.dart';
import '../utilities/constants.dart';

class SpaceVideoWidget extends StatefulWidget {
  const SpaceVideoWidget({super.key});

  @override
  SpaceVideoWidgetState createState() => SpaceVideoWidgetState();
}

class SpaceVideoWidgetState extends State<SpaceVideoWidget> {
  late Future<List<SpaceVideoModel>> _futureVideos;

  @override
  void initState() {
    super.initState();
    _futureVideos = SpaceVideoService(spaceQuery: 'space').fetchSpaceVideos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceVideoModel>>(
      future: _futureVideos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No videos available.');
        } else {
          return SizedBox(
            height: 167.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final spaceVideo = snapshot.data![index];
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            child: Image.network(
                              spaceVideo.thumbnailUrl,
                              width: 274.w,
                              height: 167.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: (274.w - 60.w) / 2,
                      top: (167.h - 60.w) / 2,
                      child: Icon(
                        Icons.play_arrow,
                        color: kPrimaryColor,
                        size: 60.w,
                      ),
                    ),
                    Positioned(
                      left: 22.w,
                      top: 120.h,
                      bottom: 14.h,
                      child: SizedBox(
                        width: 200.w,
                        child: Text(
                          spaceVideo.title,
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
      },
    );
  }
}
