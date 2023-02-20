import 'package:flutter/material.dart';

import '../../router/coordinator.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: LCoordinator.onBack,
      icon: Icon(Icons.close),
    );
  }
}
