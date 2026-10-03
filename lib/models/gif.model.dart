
class Gif {
  final String id;
  final String title;
  final String url;
  final String username;
  final String createDateTime;
  final String source;


  const Gif({
    required this.id,
    required this.title,
    required this.url,
    required this.username,
    required this.createDateTime,
    required this.source,
  });

  factory Gif.fromJson(Map<String, dynamic> json) {
    return Gif(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['images']['fixed_width']['url'] as String,
      username: json['username'] as String? ?? '', // maybe null
      createDateTime: json['create_datetime'] as String? ?? '',
      source: json['source'] as String? ?? '',
    );
  }
}
