import 'package:flutter_education_app_clean_bloc/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSoource {
  const OnBoardingLocalDataSoource();
  Future<void> cacheFirstTimer();
  Future<bool> checkFirstTimer();
}

const kFirstTimerKey = 'first_timer_key';

class OnBoardingDataSourceImple extends OnBoardingLocalDataSoource {
  const OnBoardingDataSourceImple(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _preferences.setBool(kFirstTimerKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkFirstTimer() {
    // TODO: implement checkFirstTimer
    throw UnimplementedError();
  }
}
