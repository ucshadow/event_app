import 'package:flutter/material.dart';

import '../../../models/remote/ticket_master_event/tm_event.dart';
import '../details/event_details.dart';

class HomeController {
  Future<void> openEventDetails(BuildContext context, TMEvent event) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => EventDetails(event: event),
      ),
    );
  }
}

HomeController homeController = HomeController();
