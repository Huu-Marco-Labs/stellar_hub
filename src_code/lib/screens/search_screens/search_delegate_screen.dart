import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';

class SearchDelegateScreen extends SearchDelegate {
  static const String searchDelegateScreenRoute = '/Search';

  List<String> searchItems = ['Apple', 'something'];
  List<String> matchQuery = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        child: Text(
          'cancel',
          style: kLowWeightText(
            12.sp,
            kFreudFont,
          ),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    matchQuery.clear(); // Clear previous search results
    for (var something in searchItems) {
      if (something.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(something);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }
}
