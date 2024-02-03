import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education_app_clean_bloc/core/common/views/loading_view.dart';
import 'package:flutter_education_app_clean_bloc/core/common/widget/gradient_background.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:flutter_education_app_clean_bloc/gen/assets.gen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OnboardingCubit>().checkFirstTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingCubitState>(
      listener: (context, state) {
        if (state is OnBoardingStatus && state.isFirstTimer == false) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      builder: (context, state) {
        if (state is CheckingFirstTimer || state is CashingFirstTimer) {
          return const LoadingView();
        }
        return GradientBackground(
          image: Assets.images.onBoardingBackground.path,
          child: Container(),
        );
      },
    );
  }
}
