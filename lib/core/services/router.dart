import 'package:flutter/material.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/on_boarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.routeName:
      return _pageBuilder((_) => const OnBoardingScreen(), settings);
    default:
      return _pageBuilder((_) => PageUnderConstruction(), settings);
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
