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
  late OnboardingCubit onboardingCubit;
  setUp(() {
    cacheFirstTimer = MockCacheFirstTimer();
    checkFirstTimer = MockCheckFirstTimer();
    onboardingCubit = OnboardingCubit(
      cacheFirstTimer: cacheFirstTimer,
      checkFirstTimer: checkFirstTimer,
    );
  });
  test('initial state should be onboardinginitial', () {
    expect(onboardingCubit.state, const OnboardingCubitInitial());
  });
}
