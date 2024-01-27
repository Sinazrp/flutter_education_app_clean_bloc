import 'package:dartz/dartz.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/check_first_timer.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo.mock.dart';

void main() {
  late MockOnBoarding repo;
  late CheckFirstTimer usecase;

  setUp(() {
    repo = MockOnBoarding();
    usecase = CheckFirstTimer(repo);
  });

  test(
    'should get a response from the [MockOnBoardingRepo]',
    () async {
      // arrange
      when(() => repo.checkFirstTimer()).thenAnswer(
        (_) async => const Right(true),
      );

      // act
      final result = await usecase();

      // assert
      expect(result, equals(const Right<dynamic, bool>(true)));
      verify(() => repo.checkFirstTimer()).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
