import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(
    this._localDataSource,
  );
  final OnBoardingLocalDataSoource _localDataSource;
  @override
  ResultFuture<void> cacheFirstTimer() {
    // TODO: implement cacheFirstTimer
    throw UnimplementedError();
  }

  @override
  ResultFuture<bool> checkFirstTimer() {
    // TODO: implement checkFirstTimer
    throw UnimplementedError();
  }
}
