import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'features/posts/post_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: BlogApp()));
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog AI',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const PostListScreen(),
    );
  }
}
