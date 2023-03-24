import 'package:mocktail/mocktail.dart';
import 'package:online_course_app/src/features/authentication/data/authentication_repository.dart';
import 'package:online_course_app/src/features/cart/application/cart_service.dart';
import 'package:online_course_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:online_course_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:online_course_app/src/features/course/data/course_repository.dart';

class MockAuthRepository extends Mock implements AuthenticationRepository {}

class MockLocalCartRepository extends Mock implements LocalCartRepository {}

class MockRemoteCartRepository extends Mock implements RemoteCartRepository {}

class MockCartService extends Mock implements CartService {}

class MockCourseRepository extends Mock implements CourseRepository {}
