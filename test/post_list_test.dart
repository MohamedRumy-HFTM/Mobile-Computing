import 'package:blog_ai/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows posts from the repository', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: BlogApp()));
    await tester.pumpAndSettle();
    expect(find.text('Willkommen im Blog'), findsOneWidget);
  });
}
