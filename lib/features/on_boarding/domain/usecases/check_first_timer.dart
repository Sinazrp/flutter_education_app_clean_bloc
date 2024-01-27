import 'package:flutter_education_app_clean_bloc/core/usecases/usecases.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class CheckFirstTimer extends UseCaseWithoutParams<bool> {
  const CheckFirstTimer(this._repo);
  final OnboardingRepo _repo;

  @override
  ResultFuture<bool> call() async => _repo.checkFirstTimer();
}
