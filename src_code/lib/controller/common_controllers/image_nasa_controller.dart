import 'package:get/get.dart';
import '../../models/common_models/image_nasa_model.dart';
import '../../services/nasa_services/image_nasa_service.dart';

class ImageNasaController extends GetxController {
  final RxList<ImageNasaModel> images = <ImageNasaModel>[].obs;

  Future<void> fetchImages() async {
    final List<ImageNasaModel> imageList =
        await ImageNasaService().getLast3ImagesOfTheDay();
    images.assignAll(imageList);
  }
}
