import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.appBarHeight,
  }) : super(key: key);

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      height: appBarHeight / 2,
      child: TabBar(
        indicatorColor: Theme.of(context).accentColor,
        indicatorWeight: 4,
        tabs: [
          Tab(text: 'Latest'),
          Tab(text: 'Popular'),
          Tab(text: 'Subscriptions'),
        ],
      ),
    );
  }
}
