import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';

import '../constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String searchScreenRoute = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: appBarWidget('SEARCH', ''),
    );
  }
}
