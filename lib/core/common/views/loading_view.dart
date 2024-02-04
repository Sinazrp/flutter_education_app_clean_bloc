import 'package:flutter/material.dart';
import 'package:flutter_education_app_clean_bloc/core/extensions/context_extensions.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(context.colorTheme.secondary),
        ),
      ),
    );
  }
}
