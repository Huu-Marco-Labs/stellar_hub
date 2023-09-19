import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utilities/keys.dart';

import '../models/home_screen_models/space_video_model.dart';

class SpaceVideoService {
  final String spaceQuery;

  SpaceVideoService({
    required this.spaceQuery,
  });

  Future<List<SpaceVideoModel>> fetchSpaceVideos() async {
    try {
      const maxResults = 10;

      final apiUrl = 'https://www.googleapis.com/youtube/v3/search'
          '?key=$kYoutubeApiKey'
          '&q=$spaceQuery'
          '&maxResults=$maxResults'
          '&part=snippet&type=video';

      final response = await Dio().get(apiUrl);

      final videoList =
          List<SpaceVideoModel>.from(response.data['items'].map((video) {
        return SpaceVideoModel(
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
