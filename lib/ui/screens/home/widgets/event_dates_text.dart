import 'package:flutter/material.dart';

import '../../../../util/helpers.dart';

class EventDatesText extends StatelessWidget {
  const EventDatesText({
    super.key,
    this.startDate,
    this.endDate,
  });

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 4),
          child: Icon(
            Icons.calendar_month,
            color: Colors.grey,
            size: 18,
          ),
        ),
        Expanded(
          child: Padding(
            // the calendar icon looks un-aligned
            padding: const EdgeInsets.only(top: 3),
            child: Text(_getDatesText(),
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Color(0xff7F819D),
            ),),
          ),
        ),
      ],
    );
  }

  String _getDatesText() {
    String res = '';
    if(startDate != null) {
      res += getFullDate(startDate!);
    }
    res += ' - ';
    if(endDate != null) {
      res += getFullDate(endDate!);
    }
    return res;
  }
}
