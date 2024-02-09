import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education_app_clean_bloc/core/common/views/loading_view.dart';
import 'package:flutter_education_app_clean_bloc/core/common/widget/gradient_background.dart';
import 'package:flutter_education_app_clean_bloc/core/res/colors.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/entities/page_content.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/widgets/on_boarding_body.dart';
import 'package:flutter_education_app_clean_bloc/gen/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
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

        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Stack(
            children: [
              PageView(
                controller: pageController,
                children: [
                  OnBoardingBody(pageContent: PageContent.first()),
                  OnBoardingBody(pageContent: PageContent.second()),
                  OnBoardingBody(
                    pageContent: PageContent.third(),
                    showButton: true,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Align(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const WormEffect(
                        activeDotColor: Colours.primaryColour,
                        dotColor: Colors.white),
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.bounceIn,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
