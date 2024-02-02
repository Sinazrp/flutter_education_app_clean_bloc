import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/cache_firt_timer.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/check_first_timer.dart';

part 'onboarding_cubit_state.dart';

class OnboardingCubit extends Cubit<OnboardingCubitState> {
  OnboardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckFirstTimer checkFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkFirstTimer = checkFirstTimer,
        super(const OnboardingCubitInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckFirstTimer _checkFirstTimer;
  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimer();
    result.fold(
      (l) => emit(OnBoardingError(l.errorMessage)),
      (r) => emit(const UserCached()),
    );
  }

  Future<void> checkFirstTimer() async {
    final result = await _checkFirstTimer();
    result.fold(
      (l) => emit(const OnBoardingStatus(isFirstTimer: true)),
      (r) => emit(OnBoardingStatus(isFirstTimer: r)),
    );
  }
}
