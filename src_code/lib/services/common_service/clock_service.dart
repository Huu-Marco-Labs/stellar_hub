import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/next_launch_model.dart';

class ClockService {
  final String _baseUrl = 'https://fdo.rocketlaunch.live/json/launches/next/5';

  final Dio _dio = Dio();

  Future<NextLaunchModel> getNextStart() async {
    late NextLaunchModel nextLaunchModel;

    try {
      final response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        nextLaunchModel = NextLaunchModel.toJson(jsonData);
      } else {
        if (kDebugMode) {
          print('Error: Next Launch not responded correctly.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: Next Launch not responded correctly. -> $e');
      }
    }

    return nextLaunchModel;
  }
}
