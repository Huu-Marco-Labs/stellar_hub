import 'package:dio/dio.dart';

import '../../models/common_models/news_model.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<NewsModel>> fetchSpaceNews() async {
    try {
      final response =
          await dio.get('https://api.spaceflightnewsapi.net/v3/articles');
      final data = response.data;

      List<NewsModel> newsList = [];

      for (var article in data) {
        newsList.add(
          NewsModel(
            title: article['title'],
            imageUrl: article['imageUrl'],
            publishedAt: article['publishedAt'],
            summary: article['summary'],
            newsSite: article['newsSite'],
            url: article['url'],
          ),
        );
      }

      return newsList;
    } catch (e) {
      throw Exception('Failed to fetch space news: $e');
    }
  }
}
