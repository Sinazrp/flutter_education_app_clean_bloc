import 'package:flutter/material.dart';
import 'package:flutter_education_app_clean_bloc/core/extensions/context_extensions.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/entities/page_content.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});
  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          pageContent.image,
          height: context.height * 0.4,
        )
      ],
    );
  }
}
