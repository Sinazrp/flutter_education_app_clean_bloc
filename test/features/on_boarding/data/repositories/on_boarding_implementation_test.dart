import 'package:dartz/dartz.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/exceptions.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/failure.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/repositories/on_boarding_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_local_data_source.mock.dart';

void main() {
  late OnBoardingLocalDataSoource localDataSoource;
  late OnBoardingRepoImpl repoImpl;
  setUp(() {
    localDataSoource = MockOnBoardingDataSource();
    repoImpl = OnBoardingRepoImpl(localDataSoource);
  });

  group('cashe First Timer', () {
    test('should complete succesfully ', () async {
      //arrange
      when(() => localDataSoource.cacheFirstTimer())
          .thenAnswer((_) async => Future.value());
      //act
      final result = await repoImpl.cacheFirstTimer();
      expect(result, equals(const Right<Failure, void>(null)));
      verify(() => localDataSoource.cacheFirstTimer()).called(1);
    });
    test('should return Failure', () async {
      when(
        () => localDataSoource.cacheFirstTimer(),
      ).thenThrow(const CacheException(message: 'bad req'));
      final result = await repoImpl.cacheFirstTimer();
      expect(
          result,
          Left<CacheFailure, void>(
              CacheFailure(message: 'bad req', statusCode: 500),),);

      verify(() => localDataSoource.cacheFirstTimer()).called(1);
    });
  });
}
