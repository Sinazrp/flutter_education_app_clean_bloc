import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorTheme => Theme.of(this).colorScheme;
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
