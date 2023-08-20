import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/nasa_models/image_nasa_model.dart';
import '../../constants.dart';

class ImageNasaService {
  static const String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  static const String _apiKey = kApiKey;

  final Dio _dio = Dio();

  Future<List<ImageNasaModel>> getLast3ImagesOfTheDay() async {
    List<ImageNasaModel> images = [];

    for (int i = 0; i < 3; i++) {
      try {
        final response = await _dio.get(_baseUrl, queryParameters: {
          'api_key': _apiKey,
          'date': DateTime.now()
              .subtract(Duration(days: i))
              .toString()
              .substring(0, 10),
        });
        if (response.statusCode == 200) {
          final jsonData = response.data as Map<String, dynamic>;
          final imageData = ImageNasaModel.fromJson(jsonData);
          images.add(imageData);
        } else {
          if (kDebugMode) {
            print('Error: Images not found');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error: Images not found $e');
        }
      }
    }

    return images;
  }
}
