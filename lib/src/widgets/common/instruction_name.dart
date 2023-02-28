import 'package:flutter/material.dart';

class InstructionNameLabel extends StatelessWidget {
  const InstructionNameLabel({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
