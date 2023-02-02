import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/type_defs/type_defs.dart';
import '../../../domain_manager.dart';
import '../../authentication/data/authentication_repository.dart';
import '../data/local/local__cart_repository.dart';
import '../data/remote/remote_cart_repository.dart';
import '../model/cart.dart';
import '../model/mutable_cart.dart';

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(
    authRepository: ref.watch(DomainManager.instance.authRepositoryProvider),
    localCartRepository:
        ref.watch(DomainManager.instance.localCartRepositoryProvider),
    remoteCartRepository:
        ref.watch(DomainManager.instance.remoteCartRepositoryProvider),
  );
});

final cartProvider = StreamProvider<LCart>((ref) {
  final user = ref.watch(authStateChangeStreamProvider).value;
  if (user == null) {
    return ref
        .watch(DomainManager.instance.localCartRepositoryProvider)
        .watchCart();
  } else {
    return ref
        .watch(DomainManager.instance.remoteCartRepositoryProvider)
        .watchCart(user.id);
  }
});

final cartItemsCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.courses.length,
        orElse: () => 0,
      );
});

final isAddedToCartProvider = Provider.family<bool, String>((ref, courseId) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.courses.containsKey(courseId),
        orElse: () => false,
      );
});

class CartService {
  const CartService({
    required this.authRepository,
    required this.localCartRepository,
    required this.remoteCartRepository,
  });

  final AuthenticationRepository authRepository;
  final LocalCartRepository localCartRepository;
  final RemoteCartRepository remoteCartRepository;

  /// fetch the cart from the local or remote repository depending on the user
  /// auth state
  Future<LCart> _fetchCart() {
    final user = authRepository.currentUser;
    if (user == null) return localCartRepository.fetchCart();
    return remoteCartRepository.fetchCart(user.id);
  }

  /// save the cart to the local or remote repository depending on the user
  /// auth state
  Future<void> _setCart(LCart cart) {
    final user = authRepository.currentUser;
    if (user == null) return localCartRepository.setCart(cart);
    return remoteCartRepository.setCart(user.id, cart);
  }

  /// adds an item in the local or remote cart depending on the user auth state
  Future<void> addCourse(CourseId courseId) async {
    final cart = await _fetchCart();
    final update = cart.addItem(courseId);
    await _setCart(update);
  }

  /// removes an item in the local or remote cart depending on the user auth
  /// state
  Future<void> removeCourse(CourseId courseId) async {
    final cart = await _fetchCart();
    final update = cart.removeItem(courseId);
    await _setCart(update);
  }
}
