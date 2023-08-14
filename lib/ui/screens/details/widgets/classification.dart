import 'package:flutter/material.dart';

import '../../../../models/remote/ticket_master_event/sub_models/event_classification.dart';
import '../style_provider.dart';
import 'details_section.dart';

class Classification extends StatelessWidget {
  const Classification({
    super.key,
    required this.classifications,
  });

  final List<EventClassification> classifications;

  @override
  Widget build(BuildContext context) {
    final EventClassification? primary = classifications
        .where((element) => element.primary != null && element.primary!)
        .firstOrNull;
    if (primary != null) {
      return DetailsSection(
        question: Text(
          'What?',
          style: StyleProvider.getQuestionStyle(context),
        ),
        answer: Row(
          children: [
            Text(
              primary.segment!,
              style: StyleProvider.getAnswerStyle(context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                '(${primary.genre!})',
                style: StyleProvider.getAnswerStyle(context),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
