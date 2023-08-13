import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

/// Returns a string of format - 12 Aug 2023 -
String getFullDate(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date).toString();
}