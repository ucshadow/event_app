import 'package:flutter/material.dart';

import '../../../../abstract/managers/i_local_data_manager.dart';
import '../../../../managers/dependency_manager.dart';
import '../../../../models/remote/ticket_master_event/tm_event.dart';

class EventHeart extends StatefulWidget {
  const EventHeart({
    super.key,
    required this.event,
  });

  final TMEvent event;

  @override
  State<EventHeart> createState() => _EventHeartState();
}

class _EventHeartState extends State<EventHeart> {

  bool _liked = false;
  final ILocalDataManager dataManager = dependencyManager.getLocalDataManager();

  @override
  void initState() {
    _getLiked();
    super.initState();
  }

  Future<void> _getLiked() async {

    final liked = await dataManager.isLikedById(widget.event.id);
    if(liked != _liked) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _liked = liked;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4,
      right: 4,
      child: InkWell(
        onTap: () {
          dataManager.toggleLiked(
            widget.event.id,
            this,
          );
          setState(() {
            _liked = !_liked;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/heart.png',
          color: _liked ? Colors.green : null,),
        ),
      ),
    );
  }
}
