import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/app_router.dart';

class FeaturedView extends StatelessWidget {
  const FeaturedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const Text('Featured'),
            ElevatedButton(
              onPressed: () => context.goNamed(LRoutes.search.name),
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
