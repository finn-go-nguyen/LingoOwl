import 'package:flutter/material.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import 'widgets/search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Gaps.h16,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: SearchBar(),
        ),
        // Gaps.h16,
        // BrowseCategories(hideTitle: true),
      ],
    );
  }
}
