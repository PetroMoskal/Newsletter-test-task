import 'package:flutter/material.dart';

import '/presentation/screens/home_screen/home_screen_tabs/latest_news_tab.dart';
import '/presentation/screens/home_screen/home_screen_tabs/popular_news_tab.dart';
import '/presentation/screens/home_screen/home_screen_tabs/subscriptions_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: FittedBox(
              child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ),
          ),
          title: Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.location_on_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 4,
            tabs: [
              Tab(text: 'Latest'),
              Tab(text: 'Popular'),
              Tab(text: 'Subscriptions'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              LatestNewsTab(),
              PopularNewTab(),
              SubscriptionsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
