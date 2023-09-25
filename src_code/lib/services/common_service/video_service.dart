import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/common_models/video_model.dart';
import '../../utilities/keys.dart';

class VideoService {
  final String spaceQuery;

  VideoService({
    required this.spaceQuery,
  });

  Future<List<VideoModel>> fetchSpaceVideos() async {
    try {
      const maxResults = 10;

      final apiUrl = 'https://www.googleapis.com/youtube/v3/search'
          '?key=$kYoutubeApiKey'
          '&q=$spaceQuery'
          '&maxResults=$maxResults'
          '&part=snippet&type=video';

      final response = await Dio().get(apiUrl);

      final videoList =
          List<VideoModel>.from(response.data['items'].map((video) {
        return VideoModel(
          title: video['snippet']['title'],
          thumbnailUrl: video['snippet']['thumbnails']['default']['url'],
          videoId: video['id']['videoId'],
        );
      }));

      return videoList.take(2).toList();
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching videos: $error');
      }
      return [];
    }
  }
}
