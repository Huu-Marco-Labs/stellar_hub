import 'package:get/get.dart';
import '../../../models/common_models/news_model.dart';
import '../../services/common_service/news_service.dart';

class NewsController extends GetxController {
  final RxList<NewsModel> spaceNewsList = <NewsModel>[].obs;

  Future<void> fetchSpaceNews() async {
    final List<NewsModel> news = await NewsService().fetchSpaceNews();
    spaceNewsList.assignAll(news);
  }
}
