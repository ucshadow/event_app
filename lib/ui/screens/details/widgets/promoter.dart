import 'package:flutter/material.dart';

import '../../../../models/remote/ticket_master_event/sub_models/event_promoter.dart';

class Promoter extends StatelessWidget {
  const Promoter({
    super.key,
    required this.promoter,
  });

  final EventPromoter promoter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Presented by',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        Text(
          promoter.name ?? 'No promoter',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        if (promoter.description != null) Text(' (${promoter.description!})')
      ],
    );
  }
}
