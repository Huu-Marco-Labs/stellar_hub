import 'package:dio/dio.dart';

import '../models/home_screen_models/space_news.model.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<SpaceNews>> fetchSpaceNews() async {
    try {
      final response =
          await dio.get('https://api.spaceflightnewsapi.net/v3/articles');
      final data = response.data;

      List<SpaceNews> newsList = [];

      for (var article in data) {
        newsList.add(
          SpaceNews(
            title: article['title'],
            imageUrl: article['imageUrl'],
          ),
        );
      }

      return newsList;
    } catch (e) {
      throw Exception('Failed to fetch space news: $e');
    }
  }
}
