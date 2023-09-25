import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/common_controllers/video_controller.dart';
import '../../models/common_models/video_model.dart';
import '../../utilities/constants.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoController videoController = Get.find();

    return Obx(() {
      if (videoController.videos.isEmpty) {
        videoController.fetchVideos();
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        );
      } else if (videoController.videos.isNotEmpty) {
        return VideoListWidget(videoList: videoController.videos);
      } else {
        return const Text('No videos available.');
      }
    });
  }
}

class VideoListWidget extends StatelessWidget {
  final List<VideoModel> videoList;
  const VideoListWidget({Key? key, required this.videoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          final spaceVideo = videoList[index];
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
}
