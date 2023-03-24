import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_course_app/src/constants/type_defs/type_defs.dart';
import 'package:online_course_app/src/features/authentication/model/auth_user.dart';
import 'package:online_course_app/src/features/cart/application/cart_service.dart';
import 'package:online_course_app/src/features/cart/model/cart.dart';

import '../../../mocks.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(const LCart());
  });

  late MockAuthRepository authRepository;
  late MockLocalCartRepository localCartRepository;
  late MockRemoteCartRepository remoteCartRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    localCartRepository = MockLocalCartRepository();
    remoteCartRepository = MockRemoteCartRepository();
  });

  group('setItem', () {
    const item = <CourseId, int>{'1': 0};
    test('null user, writes item to local cart', () async {
      // setup
      const expectedCart = LCart(courses: item);
      when(
        () => authRepository.currentUser,
      ).thenReturn(null);

      when(
        () => localCartRepository.fetchCart(),
      ).thenAnswer((_) async => const LCart());

      when(
        () => localCartRepository.setCart(expectedCart),
      ).thenAnswer((_) => Future<void>.value());

      final cartService = CartService(
        authRepository: authRepository,
        localCartRepository: localCartRepository,
        remoteCartRepository: remoteCartRepository,
      );

      await Future.delayed(Duration.zero);

      // run
      await cartService.localCartRepository.setCart(expectedCart);

      // verify
      verify(
        () => localCartRepository.setCart(expectedCart),
      ).called(1);
      verifyNever(
        () => remoteCartRepository.setCart(any(), any()),
      );
    });

    test('non-null user, writes item to remote cart', () async {
      // setup
      const expectedCart = LCart(courses: item);
      const testUser = LAuthUser(id: 'id', email: 'email');
      when(
        () => authRepository.currentUser,
      ).thenReturn(testUser);
      when(
        () => remoteCartRepository.fetchCart(testUser.id),
      ).thenAnswer((_) => Future.value(const LCart()));
      when(
        () => remoteCartRepository.setCart(testUser.id, expectedCart),
      ).thenAnswer((_) => Future.value());

      final cartService = CartService(
        authRepository: authRepository,
        localCartRepository: localCartRepository,
        remoteCartRepository: remoteCartRepository,
      );

      // run
      await cartService.remoteCartRepository.setCart(testUser.id, expectedCart);

      // verify
      verify(
        () => remoteCartRepository.setCart(testUser.id, expectedCart),
      ).called(1);
      verifyNever(
        () => localCartRepository.setCart(any()),
      );
    });
  });
}
