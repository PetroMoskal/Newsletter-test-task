import 'package:flutter/material.dart';

import '/presentation/icons/my_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.appBarHeight,
  }) : super(key: key);

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).accentColor),
          ),
        ),
        height: appBarHeight / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          print('menu icon tapped');
                        },
                        child: FittedBox(
                          child: Icon(
                            MyIcons.filter_list,
                            size: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'News',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print('location icon tapped');
                  },
                  child: Icon(
                    MyIcons.my_location,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 22,
                ),
                InkWell(
                  onTap: () {
                    print('search icon tapped');
                  },
                  child: Icon(
                    MyIcons.my_search,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
