import 'package:flutter/material.dart';

class no_contests_widget extends StatelessWidget {
  const no_contests_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('No contests scheduled in this timeline!', style: TextStyle(
            color: Colors.white60,
            fontSize: 16
        ),
        ),
      ),
    );
  }
}