import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_constants/profile_settings.dart';
import '../../../../constants/app_parameters/app_parameters.dart';
import '../../../../router/app_router.dart';
import '../../../../router/coordinator.dart';
import '../profile_details_controller.dart';

class ProfileTabSelector extends ConsumerWidget {
  const ProfileTabSelector({
    super.key,
    required this.current,
  });

  final LRoutes current;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const options = ProfileSettings.list;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        options.length,
        (index) {
          final option = options[index];
          final selected = current == option.route;
          return _ListTile(
            onTap: selected
                ? null
                : () {
                    LCoordinator.pushReplacementNamed(option.route.name);
                    ref
                        .read(profileDetailsControllerProvider.notifier)
                        .set(option.route);
                  },
            name: option.name,
            selected: selected,
          );
        },
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.name,
    required this.onTap,
    this.selected = false,
  });
  final String name;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: selected ? Colors.grey : null,
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: UiParameters.screenPadding,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.button?.copyWith(
                    color: selected ? Colors.white : null,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
