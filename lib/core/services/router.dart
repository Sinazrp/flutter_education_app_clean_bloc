import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_education_app_clean_bloc/core/common/views/page_under_construction.dart';
import 'package:flutter_education_app_clean_bloc/core/services/injection.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/pages/on_boarding.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.routeName:
      return _pageBuilder(
          (_) => BlocProvider(
                create: (context) => sl<OnboardingCubit>(),
                child: OnBoardingScreen(),
              ),
          settings);
    default:
      return _pageBuilder((_) => const PageUnderConstruction(), settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page,
  RouteSettings settings,
) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
