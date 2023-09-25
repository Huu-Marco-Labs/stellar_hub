class NewsModel {
  final String title;
  final String imageUrl;
  final String publishedAt;
  final String summary;
  final String newsSite;
  final String url;

  NewsModel({
    required this.title,
    required this.imageUrl,
    required this.publishedAt,
    required this.summary,
    required this.newsSite,
    required this.url,
  });

  String get formattedPublishedDate {
    final DateTime dateTime = DateTime.parse(publishedAt);
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      imageUrl: json['imageUrl'],
      publishedAt: json['publishedAt'].toString(),
      summary: json['summary'],
      newsSite: json['newsSite'],
      url: json['url'],
    );
  }
}
