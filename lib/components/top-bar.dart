import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {},
            ),
            Container(
                width: 125.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // IconButton(
                    //   icon: Icon(Icons.filter_list),
                    //   color: Colors.white,
                    //   onPressed: () {},
                    // ),
                    // IconButton(
                    //   icon: Icon(Icons.menu),
                    //   color: Colors.white,
                    //   onPressed: () {},
                    // ),
                  ],
                ))
          ],
        ));
  }
}
