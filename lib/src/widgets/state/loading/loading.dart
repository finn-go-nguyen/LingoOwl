import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    this.dimension = 100.0,
  });

  const LoadingState.small({super.key}) : dimension = 20.0;

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
