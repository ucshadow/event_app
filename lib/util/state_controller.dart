import 'package:flutter/material.dart';

/// Used as a quick state manipulation solution, as there is no need to add a
/// state library just for a 2-screen app.
/// This allows managers that extends [StateController] to refresh the state of
/// any widget that it manages, given that said widget gave access to it's own
/// state to the manager.
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