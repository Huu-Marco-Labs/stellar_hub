class NextLaunchModel {
  final String sort_date;
  final String name;
  final String provider_name;

  NextLaunchModel({
    required this.sort_date,
    required this.name,
    required this.provider_name,
  });

  factory NextLaunchModel.toJson(Map<String, dynamic> json) {
    final resultArray = json['result'] as List<dynamic>;
    final firstLaunch = resultArray[0] as Map<String, dynamic>;

    return NextLaunchModel(
      sort_date: firstLaunch['sort_date'].toString(),
      name: firstLaunch['name'].toString(),
      provider_name: firstLaunch['provider']['name'].toString(),
    );
  }
}
