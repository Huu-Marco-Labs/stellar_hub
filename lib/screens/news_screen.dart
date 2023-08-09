import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/build_app_bar_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static const String newsScreenRoute = '/news';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBarWidget('NEWS', 'Stay updated'),
    );
  }
}
