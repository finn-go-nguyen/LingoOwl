import 'package:flutter_test/flutter_test.dart';
import 'package:online_course_app/src/constants/type_defs/type_defs.dart';
import 'package:online_course_app/src/features/cart/model/cart.dart';
import 'package:online_course_app/src/features/cart/model/mutable_cart.dart';

void main() {
  group('addItem', () {
    test('Add an item to an empty cart', () {
      final cart = const LCart().addItem('1');
      expect(
        cart.courses,
        {'1': DateTime.now().millisecondsSinceEpoch},
      );
    });

    test('Add 2 items to an empty cart', () {
      final cart = const LCart().addItem('1').addItem('2');
      expect(
        cart.courses,
        {
          '1': DateTime.now().millisecondsSinceEpoch,
          '2': DateTime.now().millisecondsSinceEpoch,
        },
      );
    });

    test('Add an item twice to an empty cart', () {
      final cart = const LCart().addItem('1').addItem('1');
      expect(
        cart.courses,
        {
          '1': DateTime.now().millisecondsSinceEpoch,
        },
      );
    });

    test('Add 2 items to a non-empty cart', () {
      final cart = const LCart(courses: {'1': 0}).addItem('2').addItem('3');
      expect(
        cart.courses,
        {
          '1': 0,
          '2': DateTime.now().millisecondsSinceEpoch,
          '3': DateTime.now().millisecondsSinceEpoch,
        },
      );
    });
  });

  group('addItems', () {
    test('Add 2 items to an empty cart', () {
      final cart = const LCart().addItems({
        '1': 0,
        '2': 0,
      });
      expect(
        cart.courses,
        {
          '1': 0,
          '2': 0,
        },
      );
    });

    test('Add 2 items to an non-empty cart', () {
      final cart = const LCart(courses: {'1': 0}).addItems({
        '1': 999,
        '2': 0,
      });
      expect(
        cart.courses,
        {
          '1': 999,
          '2': 0,
        },
      );
    });

    group('removeItem', () {
      test('Remove non-existent item in an empty cart', () {
        const cart = LCart();
        final update = cart.removeItem('1');
        expect(update.courses, <CourseId, int>{});
      });
      test('Remove non-existent item in a non-empty cart', () {
        const cart = LCart(courses: {'1': 0});
        final update = cart.removeItem('2');
        expect(update.courses, {'1': 0});
      });
      test('Remove an item in cart', () {
        const cart = LCart(courses: {
          '1': 1,
          '2': 2,
          '3': 3,
        });
        final update = cart.removeItem('1');
        expect(update.courses, {
          '2': 2,
          '3': 3,
        });
      });
    });
  });
}
