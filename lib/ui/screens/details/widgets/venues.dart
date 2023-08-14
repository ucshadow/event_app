import 'package:flutter/material.dart';

import '../../../../models/remote/ticket_master_event/sub_models/event_venue.dart';
import '../style_provider.dart';
import 'details_section.dart';

class Venues extends StatelessWidget {
  const Venues({
    super.key,
    required this.venues,
  });

  final List<EventVenue> venues;

  @override
  Widget build(BuildContext context) {
    final EventVenue? shown = venues.firstOrNull;
    if (shown == null) {
      return const SizedBox();
    }

    return DetailsSection(
      question: Text(
        'Where?',
        style: StyleProvider.getQuestionStyle(context),
      ),
      answer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shown.name ?? 'Some venue',
            style: StyleProvider.getAnswerStyle(context),
          ),
          Text(
            '${shown.city} (${shown.address})',
            style: StyleProvider.getAnswerStyle(context).copyWith(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
