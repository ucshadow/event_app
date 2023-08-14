import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.question,
    required this.answer,
  });

  final Widget question;
  final Widget answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Divider(
              height: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: question,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: answer,
          ),
        ],
      ),
    );
  }
}
