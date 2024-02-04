import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/failure.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/cache_firt_timer.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/check_first_timer.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckFirstTimer extends Mock implements CheckFirstTimer {}

void main() {
  late CacheFirstTimer cacheFirstTimer;
  late CheckFirstTimer checkFirstTimer;
  late OnboardingCubit cubit;
  setUp(() {
    cacheFirstTimer = MockCacheFirstTimer();
    checkFirstTimer = MockCheckFirstTimer();
    cubit = OnboardingCubit(
      cacheFirstTimer: cacheFirstTimer,
      checkFirstTimer: checkFirstTimer,
    );
  });
  test('initial state should be onboardinginitial', () {
    expect(cubit.state, const OnboardingCubitInitial());
  });
  group('cache first timer', () {
    blocTest<OnboardingCubit, OnboardingCubitState>(
      'should complete caching',
      build: () {
        when(
          () => cacheFirstTimer(),
        ).thenAnswer((_) async => const Right(null));
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => const [CashingFirstTimer(), UserCached()],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
      },
    );
    blocTest<OnboardingCubit, OnboardingCubitState>(
      'emit cashing unsuccesfull',
      build: () {
        when(
          () => cacheFirstTimer(),
        ).thenAnswer(
          (_) async => Left(CacheFailure(message: 'oh', statusCode: 500)),
        );
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => [const CashingFirstTimer(), const OnBoardingError('oh')],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
      },
    );
  });

  group('check first timer', () {
    blocTest<OnboardingCubit, OnboardingCubitState>(
      'should emmit checking and the status',
      build: () {
        when(
          () => checkFirstTimer(),
        ).thenAnswer((_) async => const Right(false));
        return cubit;
      },
      act: (cubit) => cubit.checkFirstTimer(),
      expect: () => [
        const CheckingFirstTimer(),
        const OnBoardingStatus(isFirstTimer: false),
      ],
      verify: (_) {
        verify(() => checkFirstTimer()).called(1);
      },
    );
    blocTest<OnboardingCubit, OnboardingCubitState>(
      'should emmit error',
      build: () {
        when(
          () => checkFirstTimer(),
        ).thenAnswer(
            (_) async => Left(CacheFailure(message: 'oh', statusCode: 500)),);
        return cubit;
      },
      act: (cubit) => cubit.checkFirstTimer(),
      expect: () => [
        const CheckingFirstTimer(),
        const OnBoardingStatus(isFirstTimer: true),
      ],
      verify: (_) {
        verify(() => checkFirstTimer()).called(1);
      },
    );
  });
}
