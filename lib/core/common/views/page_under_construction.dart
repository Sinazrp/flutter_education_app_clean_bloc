import 'package:flutter/material.dart';
import 'package:flutter_education_app_clean_bloc/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('page under construction');
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        // ignore: require_trailing_commas
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.onBoardingBackground.path),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child:
              Center(child: Lottie.asset(Assets.lottie.pageUnderConstruction)),
        ),
      ),
    );
  }
}
