import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../router/coordinator.dart';
import '../../../utils/async_value_ui.dart';
import 'package:uuid/uuid.dart';
import '../../../constants/type_defs/type_defs.dart';
import 'checkout_controller.dart';
import '../../authentication/data/authentication_repository.dart';
import '../model/item.dart';
import '../model/order.dart';

import '../../../widgets/dialog/alert_dialog.dart';

class BuyButton extends ConsumerWidget {
  const BuyButton({super.key, required this.courseId, required this.price});

  final CourseId courseId;
  final double price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(checkoutControllerProvider, (previous, next) {
      next.showErrorLoadingSuccessState(context,
          previousState: previous, successMessage: 'Payment successful');
    });

    final isSignedIn = ref.watch(isSignedInProvider);
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isSignedIn
            ? () async {
                final order = LOrder(
                  id: const Uuid().v4(),
                  uid: ref.read(uidProvider)!,
                  timeStamp: DateTime.now().millisecondsSinceEpoch,
                  items: <LItem>[LItem(courseId: courseId, amount: price)],
                );
                ref
                    .read(checkoutControllerProvider.notifier)
                    .onBuyButtonPressed(
                      order,
                      onPaymentSuccessful: () => LCoordinator.showHomeScreen(),
                    );
              }
            : () => showSignInRequiredDialog(
                  context: context,
                  content: 'Sign in to enroll in this course.',
                ),
        child: const Text('Buy now'),
      ),
    );
  }
}
