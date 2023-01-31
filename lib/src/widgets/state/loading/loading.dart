import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
