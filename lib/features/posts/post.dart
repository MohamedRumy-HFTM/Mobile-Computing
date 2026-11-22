class Post {
  const Post({
    required this.id,
    required this.title,
    required this.content,
    this.tags = const [],
  });

  final String id;
  final String title;
  final String content;
  final List<String> tags;
}
