import 'package:flutter/material.dart';

class GroupItemWidget extends StatefulWidget {
  @override
  _GroupItemWidgetState createState() => _GroupItemWidgetState();
}

class _GroupItemWidgetState extends State<GroupItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        height: 120.0,
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.all(16.0),
        child: Text('DSDSDS'),



      )

    );
  }
}