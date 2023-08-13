import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/remote/ticket_master_event/tm_event.dart';

abstract class IEventManager {
  late State searchResultsState;
  late PagingController<int, TMEvent> pagingController;
  final TextEditingController searchController = TextEditingController();
  StreamController<int> streamController = StreamController<int>();
  Stream<int>? broadcast;
  int pageSize = 10;
  bool isLoading = false;

  Future<List<TMEvent>> getEvents();
  void resetParams();
  Future<List<TMEvent>> getEventsWithKeyWord();
  Future<void> fetchPage({bool newSearch = false});
  void applySearch({bool force = false});
  int getCurrentPageNumber();
}