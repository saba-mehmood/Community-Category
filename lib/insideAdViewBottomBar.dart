import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class InsideAdBottomBar extends StatefulWidget {
  @override
  _InsideAdBottomBarState createState() => _InsideAdBottomBarState();
}

class _InsideAdBottomBarState extends State<InsideAdBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
      child: Stack(
        children: [
          Positioned(
            //top: 155,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              height: 51,
              color: Color(0xFFF4F6FF),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    width: 150,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text(
                        'Call',
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      color: Color(0xFF1877F2),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 150,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text(
                        'Chat',
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                      color: Color(0xFF1877F2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )



    );
  }
}

