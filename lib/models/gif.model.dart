
class Gif {
  final String id;
  final String title;
  final String url;

  const Gif({
    required this.id,
    required this.title,
    required this.url
  });

  factory Gif.fromJson(Map<String, dynamic> json) {
    return Gif(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['images']['fixed_width']['url'] as String
    );
  }
}
