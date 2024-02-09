import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education_app_clean_bloc/core/extensions/context_extensions.dart';
import 'package:flutter_education_app_clean_bloc/core/res/fonts.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/entities/page_content.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/cubit/onboarding_cubit_cubit.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, this.showButton, super.key});
  final PageContent pageContent;
  final bool? showButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pageContent.image,
          height: context.height * 0.4,
        ),
        SizedBox(
          height: context.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: Fonts.aeonik,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: Fonts.poppins,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              if (showButton ?? false)
                ElevatedButton(
                  onPressed: () async {
                    await context.read<OnboardingCubit>().cacheFirstTimer();
                  },
                  child: const Text('get Started'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
