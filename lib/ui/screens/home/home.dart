import 'package:flutter/material.dart';

import '../../../util/helpers.dart';
import 'search/search_area.dart';
import 'widgets/app_bar_text.dart';
import 'widgets/search_results.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              _createSilverAppBar(context),
            ];
          },
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints _) {
              return const Padding(
                padding: EdgeInsets.only(top: 32),
                child: SearchResults(),
              );
            },
          ),
        ),
      ),
    );
  }

  SliverAppBar _createSilverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      flexibleSpace: Container(
        color:
            isDarkMode(context) ? Theme.of(context).canvasColor : Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(top: 30, left: 8),
              title: AppBarText(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchArea(),
            ),
          ],
        ),
      ),
    );
  }
}
