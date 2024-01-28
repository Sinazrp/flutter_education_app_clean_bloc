import 'package:flutter/services.dart';
import 'package:flutter_education_app_clean_bloc/core/errors/exceptions.dart';
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
  group('cache first time', () {
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

    test('should throw exception', () async {
      when(
        () => preferences.setBool(any(), any()),
      ).thenThrow(Exception());
      final methodCall = dataSourceImple.cacheFirstTimer;
      expect(methodCall, throwsA(isA<CacheException>()));
      verify(
        () => preferences.setBool(kFirstTimerKey, false),
      ).called(1);
      verifyNoMoreInteractions(preferences);
    });
  });

  group('if user first timer', () {
    test('check if it is first time ', () async {
      when(
        () => preferences.getBool(any()),
      ).thenReturn(false);

      final result = await dataSourceImple.checkFirstTimer();
      expect(result, false);
      verify(
        () => preferences.getBool(kFirstTimerKey),
      ).called(1);
      verifyNoMoreInteractions(preferences);
    });

    test('should be true if it is null ', () async {
      when(
        () => preferences.getBool(any()),
      ).thenReturn(null);

      final result = await dataSourceImple.checkFirstTimer();
      expect(result, true);
      verify(
        () => preferences.getBool(kFirstTimerKey),
      ).called(1);
      verifyNoMoreInteractions(preferences);
    });

    test('should throw exception ', () async {
      when(
        () => preferences.getBool(any()),
      ).thenThrow(Exception());

      final result = dataSourceImple.checkFirstTimer;
      expect(result, throwsA(isA<CacheException>()));
      verify(
        () => preferences.getBool(kFirstTimerKey),
      ).called(1);
      verifyNoMoreInteractions(preferences);
    });
  });
}
