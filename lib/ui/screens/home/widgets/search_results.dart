import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../abstract/managers/i_event_manager.dart';
import '../../../../managers/dependency_manager.dart';
import '../../../../models/remote/ticket_master_event/tm_event.dart';
import 'event_card.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  final IEventManager eventManager = dependencyManager.getEventManger();

  @override
  void initState() {
    eventManager.pagingController = PagingController(firstPageKey: 0);
    eventManager.pagingController.addPageRequestListener((pageKey) {
      eventManager.fetchPage();
    });
    eventManager.searchResultsState = this;
    super.initState();
  }

  @override
  void dispose() {
    eventManager.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(eventManager.isLoading) {
      return const SizedBox(
        child: Center(
          child: SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return PagedListView<int, TMEvent>(
      pagingController: eventManager.pagingController,
      builderDelegate: PagedChildBuilderDelegate<TMEvent>(
        itemBuilder: (context, item, index) => EventCard(event: item),
      ),
    );
  }
}
