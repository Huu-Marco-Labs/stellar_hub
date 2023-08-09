import 'package:flutter/material.dart';
import 'package:stellarhub/widgets/build_app_bar_widget.dart';

import '../constants.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  static const String exploreScreenRoute = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBarWidget('EXPLORE', 'The Universe'),
    );
  }
}
