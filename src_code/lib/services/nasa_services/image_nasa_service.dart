import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/image_nasa_model.dart';
import '../../constants.dart';

class ImageNasaService {
  static const String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  static const String _apiKey = kApiKey;

  final Dio _dio = Dio();

  final String date1 =
      DateTime.now().subtract(Duration(days: 0)).toString().substring(0, 10);
  final String date2 =
      DateTime.now().subtract(Duration(days: 1)).toString().substring(0, 10);
  final String date3 =
      DateTime.now().subtract(Duration(days: 2)).toString().substring(0, 10);

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

  //Experimental (not working)
  Future<List<ImageNasaModel>> getImages() async {
    List<ImageNasaModel> images = [];

    Future<ImageNasaModel> one = apiCall(date1);
    Future<ImageNasaModel> two = apiCall(date2);
    Future<ImageNasaModel> three = apiCall(date3);

    await one;
    images.add(one as ImageNasaModel);

    await two;
    images.add(two as ImageNasaModel);

    await three;
    images.add(three as ImageNasaModel);

    return images;
  }

  Future<ImageNasaModel> apiCall(String date) async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'api_key': _apiKey,
        'date': date,
      });
      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        ImageNasaModel imageData = ImageNasaModel.fromJson(jsonData);
        return imageData;
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
    ImageNasaModel error = ImageNasaModel(
        date: "date",
        explanation: "explanation",
        hdurl: "hdurl",
        mediaType: "mediaType",
        serviceVersion: "serviceVersion",
        title: "title",
        url: "url");
    return error;
  }
}
