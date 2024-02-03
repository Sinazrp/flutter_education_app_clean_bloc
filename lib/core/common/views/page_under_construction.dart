import 'package:flutter/material.dart';
import 'package:flutter_education_app_clean_bloc/core/common/widget/gradient_background.dart';
import 'package:flutter_education_app_clean_bloc/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: Assets.images.onBoardingBackground.path,
        child: Center(child: Lottie.asset(Assets.lottie.pageUnderConstruction)),
      ),
    );
  }
}
