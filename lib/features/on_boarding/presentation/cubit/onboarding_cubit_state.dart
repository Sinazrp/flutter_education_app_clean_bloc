part of 'onboarding_cubit_cubit.dart';

sealed class OnboardingCubitState extends Equatable {
  const OnboardingCubitState();
  @override
  List<Object> get props => [];
}

class OnboardingCubitInitial extends OnboardingCubitState {
  const OnboardingCubitInitial();
  @override
  List<Object> get props => [];
}

class CasheFirstTimer extends OnboardingCubitState {
  const CasheFirstTimer();
  @override
  List<Object> get props => [];
}

class CheckFirstTimer extends OnboardingCubitState {
  @override
  List<Object> get props => [];
}

class UserCached extends OnboardingCubitState {
  @override
  List<Object> get props => [];
}

class OnBoardingStatus extends OnboardingCubitState {
  const OnBoardingStatus({required this.isFirstTimer});
  final bool isFirstTimer;
  @override
  List<Object> get props => [isFirstTimer];
}
