import 'package:flutter/material.dart';

import '../../../../abstract/managers/i_event_manager.dart';
import '../../../../managers/dependency_manager.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({super.key});

  @override
  Widget build(BuildContext context) {
    final IEventManager eventManager = dependencyManager.getEventManger();
    final TextStyle style = TextStyle(
      color: Theme.of(context).textTheme.bodyLarge!.color ?? Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
    return StreamBuilder<int>(
      stream: eventManager.broadcast,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data! > 0) {
          return Text(
            'Events - ${snapshot.data} shown',
            style: style,
          );
        }
        return Text(
          'Events',
          style: style,
        );
      },
    );
  }
}
