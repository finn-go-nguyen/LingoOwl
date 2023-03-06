import 'package:flutter/material.dart';

import '../state/loading/loading.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onSubmitted,
    this.isLoading = false,
    this.label = 'Submit',
  });

  final bool isLoading;
  final String label;
  final VoidCallback? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onSubmitted,
      child: isLoading ? const LoadingState.small() : Text(label),
    );
  }
}
