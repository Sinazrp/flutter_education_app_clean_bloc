import 'package:flutter/material.dart';
import 'package:flutter_education_app_clean_bloc/core/res/colors.dart';
import 'package:flutter_education_app_clean_bloc/core/res/fonts.dart';
import 'package:flutter_education_app_clean_bloc/core/services/injection.dart';
import 'package:flutter_education_app_clean_bloc/core/services/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Fonts.poppins,
        colorScheme: ColorScheme.fromSeed(seedColor: Colours.primaryColour),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
