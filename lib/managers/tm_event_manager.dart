import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../abstract/managers/i_event_manager.dart';
import '../models/remote/ticket_master_event/tm_event.dart';
import '../net/ticket_master_api.dart';
import '../util/logger.dart';
import '../util/state_controller.dart';

class TMEventManager extends StateController implements IEventManager {
  TMEventManager() {
    broadcast = streamController.stream.asBroadcastStream();
  }

  @override
  late State searchResultsState;

  final List<TMEvent> _cached = [];

  @override
  final TextEditingController searchController = TextEditingController();

  @override
  late PagingController<int, TMEvent> pagingController;

  @override
  StreamController<int> streamController = StreamController<int>();

  @override
  Stream<int>? broadcast;

  String _lastKeyWord = '';
  int _currentPageNumber = 0;
  int _eventsShown = 0;

  @override
  int pageSize = 10;

  @override
  bool isLoading = false;

  /// Used to prevent multiple request to the same endpoint when the screen
  /// refreshes way too fast (or the internet is way too slow).
  /// Basically we only use one Future for the api call and every request
  /// to the same end point awaits that future to end
  Future<List<TMEvent>>? _getEvents;

  DateTime _lastApiCall = DateTime.now();
  final Duration _timeout = const Duration(seconds: 2);

  @override
  void resetParams() {
    _lastKeyWord = searchController.text;
    _currentPageNumber = 0;
    _eventsShown = 0;
    streamController.sink.add(_eventsShown);
  }

  @override
  Future<List<TMEvent>> getEventsWithKeyWord() async {
    final DateTime now = DateTime.now();
    final DateTime check = _lastApiCall.add(_timeout);

    if(now.isBefore(check) && _cached.isNotEmpty) {
      logger.i('Returning old data, throttled');
      return _cached;
    }

    _lastApiCall = now;

    if (_getEvents != null) {
      return await _getEvents!;
    }

    if (searchController.text != _lastKeyWord) {
      resetParams();
    }

    _cached.clear();
    _getEvents = TicketMasterApi().getPaginatedEvents(
      _currentPageNumber,
      pageSize,
      _lastKeyWord,
    );
    _cached.addAll(await _getEvents!);
    _eventsShown += _cached.length;

    streamController.sink.add(_eventsShown);
    _getEvents = null;
    _currentPageNumber++;
    return _cached;
  }

  @override
  Future<List<TMEvent>> getEvents() async {
    if (_getEvents != null) {
      return await _getEvents!;
    }
    if (_cached.isEmpty) {
      _getEvents = TicketMasterApi().getEvents();
      _cached.addAll(await _getEvents!);
    }
    _getEvents = null;
    return _cached;
  }

  @override
  Future<void> fetchPage({bool newSearch = false}) async {
    try {
      final newItems = await getEventsWithKeyWord();
      final isLastPage = newItems.length < pageSize;
      if(newSearch) {
        pagingController.itemList = [];
      }
      isLoading = false;
      rebuildWidgets(states: [searchResultsState]);
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageNumber = getCurrentPageNumber();
        pagingController.appendPage(newItems, nextPageNumber);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void _applySearch() {
    isLoading = true;
    rebuildWidgets(states: [searchResultsState]);
    fetchPage(newSearch: true);
  }

  @override
  void applySearch({bool force = false}) {
    if(force) {
      _applySearch();
      return;
    }
    if(searchController.text == _lastKeyWord) {
      return;
    }
    _applySearch();
  }

  @override
  int getCurrentPageNumber() {
    return _currentPageNumber;
  }
}

TMEventManager tmEventManager = TMEventManager();
