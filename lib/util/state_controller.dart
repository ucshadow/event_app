import 'package:flutter/material.dart';

class StateController extends State {
  /// Call the setState function on all the given states
  void rebuildWidgets({VoidCallback? setStates, List<State>? states}) {
    if (states != null) {
      for (final State<StatefulWidget> state in states) {
        if (state.mounted) {
          state.setState(setStates ?? () {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /// This build function will never be called.
    /// It has to be overridden here because State interface requires this
    return const SizedBox();
  }
}