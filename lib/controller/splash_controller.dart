import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double beginRotate = 0.3;
  double endRotate = -10;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.addListener(() {
      update();
    });
    _animationController.forward(from: 0.0);
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  double getCurrentRotation() {
    return Tween<double>(
      begin: beginRotate,
      end: endRotate,
    ).evaluate(_animationController);
  }
}
