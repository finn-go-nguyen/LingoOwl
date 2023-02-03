import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    this.dimension = 100.0,
  });

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
