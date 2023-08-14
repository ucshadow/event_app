import 'package:flutter/material.dart';

class StyleProvider {
  static TextStyle getQuestionStyle(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 20,
        fontWeight: FontWeight.w500);
  }

  static TextStyle getAnswerStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.bodyLarge!.color ?? Colors.blueGrey,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }
}
