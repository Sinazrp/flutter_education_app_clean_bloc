part of 'onboarding_cubit_cubit.dart';

sealed class OnboardingCubitState extends Equatable {
  const OnboardingCubitState();

  @override
  List<Object> get props => [];
}

class OnboardingCubitInitial extends OnboardingCubitState {
  const OnboardingCubitInitial();
}

class CasheFirstTimer extends OnboardingCubitState {
  const CasheFirstTimer();
}

class CheckFirstTimer extends OnboardingCubitState {
  const CheckFirstTimer();
}

class UserCached extends OnboardingCubitState {
  const UserCached();
}

class OnBoardingStatus extends OnboardingCubitState {
  const OnBoardingStatus();
  final bool isFirstTimer = 
}
