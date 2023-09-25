class TweetModel {
  final String id;
  final String text;
  final DateTime createdAt;
  final int likes;
  final int retweets;

  TweetModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.likes,
    required this.retweets,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) {
    return TweetModel(
      id: json['id'],
      text: json['text'],
      createdAt: DateTime.parse(json['created_at']),
      likes: json['favorite_count'],
      retweets: json['retweet_count'],
    );
  }
}
