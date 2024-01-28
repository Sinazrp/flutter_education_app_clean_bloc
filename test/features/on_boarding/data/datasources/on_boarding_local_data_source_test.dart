import 'package:flutter_education_app_clean_bloc/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockPref extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences preferences;
  late OnBoardingDataSourceImple dataSourceImple;
  setUp(() {
    preferences = MockPref();
    dataSourceImple = OnBoardingDataSourceImple(preferences);
  });
  test('should call shared prefrences', () async {
    when(
      () => preferences.setBool(any(), any()),
    ).thenAnswer((_) async => false);

    await dataSourceImple.cacheFirstTimer();

    verify(
      () => preferences.setBool(kFirstTimerKey, false),
    ).called(1);
    verifyNoMoreInteractions(preferences);
  });
}
