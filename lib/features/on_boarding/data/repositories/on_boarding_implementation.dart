import 'package:dartz/dartz.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/exceptions.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/failure.dart';
import 'package:flutter_education_app_clean_bloc/core/utils/type_defs.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(
    this._localDataSource,
  );
  final OnBoardingLocalDataSoource _localDataSource;
  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkFirstTimer() async {
    try {
      return Right(await _localDataSource.checkFirstTimer());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
