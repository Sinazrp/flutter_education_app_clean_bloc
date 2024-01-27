import 'package:dartz/dartz.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/failure.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/cache_firt_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo.mock.dart';

void main() {
  late OnboardingRepo repo;
  late CacheFirstTimer useCase;
  setUp(() {
    repo = MockOnBoarding();
    useCase = CacheFirstTimer(repo);
  });

  test('should call the [onBoardimg.cashe] and return nll', () async {
    //Arrange
    when(() => repo.cacheFirstTimer())
        .thenAnswer((_) async => const Right<Failure, void>(null));

    //act
    final result = await useCase();

    //assert
    expect(result, const Right<Failure, void>(null));

    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });

  test('should call the [onBoardimg.cashe] and return Failure', () async {
    //Arrange
    when(() => repo.cacheFirstTimer()).thenAnswer(
      (_) async => Left<Failure, void>(
        ServerFailure(message: 'unknown error', statusCode: 500),
      ),
    );

    //act
    final result = await useCase();

    //assert
    expect(
      result,
      Left<Failure, void>(
        ServerFailure(message: 'unknown error', statusCode: 500),
      ),
    );

    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
