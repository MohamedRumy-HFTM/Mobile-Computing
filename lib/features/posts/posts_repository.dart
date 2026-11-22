import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'post.dart';

// ponytail: in-memory data until the blog backend is connected; swap the body of
// fetchPosts() for HTTP calls, the provider and UI stay unchanged.
class PostsRepository {
  final _posts = <Post>[
    const Post(
      id: '1',
      title: 'Willkommen im Blog',
      content: 'Dies ist der erste Beitrag. Bald mit KI-Zusammenfassung.',
      tags: ['intro'],
    ),
  ];

  Future<List<Post>> fetchPosts() async => List.unmodifiable(_posts);
}

final postsRepositoryProvider = Provider((ref) => PostsRepository());

final postsProvider = FutureProvider<List<Post>>(
  (ref) => ref.watch(postsRepositoryProvider).fetchPosts(),
);
