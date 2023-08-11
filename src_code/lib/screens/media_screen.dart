import 'package:flutter/material.dart';
import 'package:stellarhub/widgets/sliver_app_bar_widget.dart';
import '../widgets/app_bar_widget.dart';

import '../constants.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});
  static const String mediaScreenRoute = '/media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            sliverAppBarWidget('MEDIA', 'Resource Archive'),
          ];
        },
        body: Container(),
      ),
    );
  }
}
