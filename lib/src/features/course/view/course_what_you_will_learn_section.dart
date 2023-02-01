import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';

class WhatYouWillLearn extends StatelessWidget {
  const WhatYouWillLearn({
    super.key,
    required this.contents,
  });

  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('What you\'ll learn'),
        Gaps.h12,
        ...List.generate(
          contents.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check),
                Gaps.w12,
                Expanded(
                  child: Text(
                    contents[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
