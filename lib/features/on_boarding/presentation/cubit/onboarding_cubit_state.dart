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

class CashingFirstTimer extends OnboardingCubitState {
  const CashingFirstTimer();
  @override
  List<Object> get props => [];
}

class CheckingFirstTimer extends OnboardingCubitState {
  const CheckingFirstTimer();
  @override
  List<Object> get props => [];
}

class UserCached extends OnboardingCubitState {
  const UserCached();
  @override
  List<Object> get props => [];
}

class OnBoardingStatus extends OnboardingCubitState {
  const OnBoardingStatus({required this.isFirstTimer});
  final bool isFirstTimer;
  @override
  List<Object> get props => [isFirstTimer];
}

class OnBoardingError extends OnboardingCubitState {
  const OnBoardingError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
