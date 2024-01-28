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
    await _preferences.setBool(kFirstTimerKey, false);
  }

  @override
  Future<bool> checkFirstTimer() {
    // TODO: implement checkFirstTimer
    throw UnimplementedError();
  }
}
