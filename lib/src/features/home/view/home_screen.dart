import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../router/app_router.dart';
import '../../../widgets/common/scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home screen'),
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                onPressed: () => context.goNamed(LRoute.settings.name),
                child: const Text('Go to profile screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
