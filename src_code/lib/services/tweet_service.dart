import 'package:dio/dio.dart';
import '../models/tweet_model.dart';
import '../utilities/keys.dart';


class TweetService {
  final Dio _dio = Dio();

  Future<List<TweetModel>> getLatestNasaTweets(int count) async {
    try {
      final response = await _dio.get(
        'https://api.twitter.com/2/tweets/search/recent',
        queryParameters: {
          'query': 'from:nasa',
          'max_results': count,
        },
        options: Options(
          headers: {
            'Authorization': kXBearerToken,
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> tweetData = response.data['data'];
        return tweetData.map((json) => TweetModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tweets');
      }
    } catch (e) {
      throw Exception('Failed to load tweets: $e');
    }
  }
}
