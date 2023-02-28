import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../widgets/dialog/alert_dialog.dart';
import 'search_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: UiParameters.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          // vertical: Sizes.p12,
          horizontal: Sizes.p20,
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            Gaps.w12,
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () => showSearch(
                    context: context,
                    useRootNavigator: true,
                    delegate: CourseSearchDelegate(context, ref),
                  ),
                  child: const Text(
                    'Find interesting courses...',
                  ),
                );
              }),
            ),
            IconButton(
              onPressed: () => showNotImplementedAlertDialog(context: context),
              icon: const Icon(Icons.mic),
            )
          ],
        ),
      ),
    );
  }
}
