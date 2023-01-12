import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../router/app_router.dart';
import '../../../widgets/common/scaffold.dart';
import '../../authentication/data/authentication_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home screen'),
            Consumer(
              builder: (context, ref, child) => ElevatedButton(
                onPressed: () {
                  ref
                      .read(authenticationRepositoryProvider)
                      .signOut()
                      .then((value) => context.goNamed(LRoute.welcome.name));
                },
                child: const Text('Sign out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
