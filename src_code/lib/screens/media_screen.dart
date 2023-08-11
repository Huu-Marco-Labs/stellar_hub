import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';

import '../constants.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});
  static const String mediaScreenRoute = '/media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: appBarWidget('MEDIA', 'Resource Archive'),
    );
  }
}
