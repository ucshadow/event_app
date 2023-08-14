import 'package:flutter/material.dart';

import '../../../../models/remote/ticket_master_event/sub_models/event_dates.dart';
import '../../shared/event_dates_text.dart';
import '../style_provider.dart';
import 'details_section.dart';

class Dates extends StatelessWidget {
  const Dates({
    super.key,
    required this.dates,
  });

  final EventDates dates;

  @override
  Widget build(BuildContext context) {
    return DetailsSection(
      question: Text(
        'When',
        style: StyleProvider.getQuestionStyle(context),
      ),
      answer: EventDatesText(
        startDate: EventDates.asDate(dates.start),
        endDate: EventDates.asDate(dates.end),
      ),
    );
  }
}
