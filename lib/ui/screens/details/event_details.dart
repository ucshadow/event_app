import 'package:flutter/material.dart';

import '../../../models/remote/ticket_master_event/tm_event.dart';
import 'widgets/carousel.dart';
import 'widgets/classification.dart';
import 'widgets/dates.dart';
import 'widgets/promoter.dart';
import 'widgets/venues.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({
    super.key,
    required this.event,
  });

  final TMEvent event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // promoter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Promoter(promoter: event.promoter),
              ),

              // images
              Carousel(
                images: event.images,
              ),
              Column(
                children: [
                  // dates
                  Dates(
                    dates: event.dates,
                  ),

                  // classification
                  Classification(
                    classifications: event.classifications,
                  ),

                  // venues
                  Venues(
                    venues: event.venues,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
