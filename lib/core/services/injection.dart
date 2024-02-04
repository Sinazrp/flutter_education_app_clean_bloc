import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/repositories/on_boarding_implementation.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/cache_firt_timer.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/domain/usecases/check_first_timer.dart';
import 'package:flutter_education_app_clean_bloc/features/on_boarding/presentation/cubit/onboarding_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerFactory(
      () => OnboardingCubit(cacheFirstTimer: sl(), checkFirstTimer: sl()),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSoource>(
      () => OnBoardingDataSourceImple(sl()),
    )
    ..registerLazySingleton(() => prefs);
}
