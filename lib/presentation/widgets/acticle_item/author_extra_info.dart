import 'package:flutter/material.dart';

class AuthorExtraInfo extends StatelessWidget {
  final String info;
  final Color color;
  AuthorExtraInfo(this.info, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      child: Text(
        info,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
