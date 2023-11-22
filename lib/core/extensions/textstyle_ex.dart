import 'package:flutter/material.dart';

extension TextStyleX on TextStyle {
  TextStyle? colorEx(Color color) {
    return copyWith(color: color);
  }
}
