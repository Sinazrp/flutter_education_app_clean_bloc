import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';

abstract class OnBoardingRepo {
  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> checkFirstTimer();
}
