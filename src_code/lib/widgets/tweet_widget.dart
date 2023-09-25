import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/tweet_model.dart';

class TweetWidget extends StatelessWidget {
  final List<TweetModel> tweets;

  const TweetWidget({super.key, required this.tweets});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (TweetModel tweet in tweets)
          Padding(
            padding: EdgeInsets.only(bottom: 16.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tweet.text,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(Icons.favorite_border),
                    const SizedBox(width: 8.0),
                    Text('${tweet.likes} Likes'),
                    const SizedBox(width: 16.0),
                    const Icon(Icons.repeat),
                    const SizedBox(width: 8.0),
                    Text('${tweet.retweets} Retweets'),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
