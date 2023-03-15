import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../constants/type_defs/type_defs.dart';
import '../../../../widgets/common/common.dart';
import '../../../../widgets/state/loading/loading.dart';
import '../../../cart/view/cart_icon_button/cart_icon_button.dart';
import '../../../course/view/course_card.dart';
import '../search_view_controller.dart';

class CourseSearchDelegate extends SearchDelegate<CourseId> {
  CourseSearchDelegate(BuildContext context, this.ref)
      : super(
          searchFieldLabel: 'Find interesting courses...',
          searchFieldStyle: Theme.of(context).textTheme.bodyLarge,
        );

  final WidgetRef ref;

  @override
  List<Widget>? buildActions(BuildContext context) {
    EasyDebounce.debounce(
      'debounce',
      const Duration(milliseconds: 500), //
      () =>
          ref.read(searchViewControllerProvider.notifier).onQueryChanged(query),
    );

    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
        ),
      const CartIconButton(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final result = ref.watch(searchViewControllerProvider);
        return result.when(
          loading: LoadingState.small,
          error: (_, __) => const SizedBox.shrink(),
          data: (state) => ListView.builder(
            itemCount: state.courses.length,
            itemBuilder: (context, index) => CourseCardLandscape(
              course: state.courses[index],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final result = ref.watch(searchViewControllerProvider);
        return result.when(
          loading: LoadingState.small,
          error: (_, __) => const SizedBox.shrink(),
          data: (state) => state.courses.isEmpty
              ? const Padding(
                  padding: EdgeInsets.only(top: Sizes.p16),
                  child: BrowseCategories(hideTitle: true),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: Sizes.p16),
                      child: Text(
                        'Results',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          final course = state.courses[index];
                          return ListTile(
                            onTap: () {
                              query = course.name;
                              showResults(context);
                            },
                            minLeadingWidth: 0.0,
                            leading: const Icon(Icons.search),
                            title: Text(course.name),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
