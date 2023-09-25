import 'package:get/get.dart';
import '../../models/common_models/video_model.dart';
import '../../services/common_service/video_service.dart';

class VideoController extends GetxController {
  final RxList<VideoModel> videos = <VideoModel>[].obs;

  Future<void> fetchVideos() async {
    final List<VideoModel> videoList =
        await VideoService(spaceQuery: 'space').fetchSpaceVideos();
    videos.assignAll(videoList);
  }
}
