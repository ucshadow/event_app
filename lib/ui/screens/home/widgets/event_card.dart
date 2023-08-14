import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../../../models/remote/ticket_master_event/sub_models/event_dates.dart';
import '../../../../models/remote/ticket_master_event/tm_event.dart';
import '../../../../util/helpers.dart';
import '../home_controller.dart';
import '../../shared/event_dates_text.dart';
import 'event_heart.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final TMEvent event;

  @override
  Widget build(BuildContext context) {
    final bool isDark = isDarkMode(context);
    return GestureDetector(
      onTap: () => homeController.openEventDetails(context, event),
      child: Card(
        elevation: 8,
        surfaceTintColor: isDark ? Theme.of(context).canvasColor : Colors.white,
        color: isDark ? Theme.of(context).canvasColor : Colors.white,
        child: Stack(
          children: [
            Row(
              children: [
                // event image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: event.images.first.url,
                      height: 81,
                      width: 81,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // event data
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // name
                        Text(
                          event.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // dates
                        EventDatesText(
                          startDate: EventDates.asDate(event.dates.start),
                          endDate: EventDates.asDate(event.dates.end),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // Event heart
            EventHeart(event: event),
          ],
        ),
      ),
    );
  }
}
