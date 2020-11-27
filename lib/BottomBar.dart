import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularOuterNotchedRectangle(),
        child: Container(
          height: 53,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 3.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Tabs(title: 'Feed', icon: 'Feed', notifyParent: refresh),
              Tabs(title: 'Saved', icon: 'Saved', notifyParent: refresh),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Post your ad",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Roboto-Regular',
                      color: Color(0xFF919396),
                    ),
                  ),
                ],
              ), // The dummy child
              Tabs(title: 'Chats', icon: 'Chats', notifyParent: refresh),
              Tabs(title: 'Menu', icon: 'Menu', notifyParent: refresh),
            ],
          ),
        ));
  }
}

class DockerButton extends StatelessWidget {
  const DockerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: FloatingActionButton(
          backgroundColor: Color(0xFF1877F2),
          elevation: 0,
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {}),
    );
  }
}

class Tabs extends StatefulWidget {
  final String title;
  final String icon;
  final Function() notifyParent;

  const Tabs({
    Key key,
    this.title,
    this.icon,
    this.notifyParent,
  }) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

String selected = 'Feed';

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: selected == widget.title ? Color(0xFF1877F2) : Colors.white,
          margin: EdgeInsets.only(bottom: 7.5),
          height: 2,
          width: 40,
        ),
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: SvgPicture.asset(
                selected == widget.title
                    ? 'assets/${widget.icon}IconFilled.svg'
                    : 'assets/${widget.icon}Icon.svg',
              ),
              onPressed: () {
                selected = widget.title;
                widget.notifyParent();
              },
            ),
            SizedBox(height: 3),
            Text(
              this.widget.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Roboto-Regular',
                color: selected == widget.title
                    ? Color(0xFF1877F2)
                    : Color(0xFF919396),
              ),
            ),
          ],
        )),
      ],
    );
  }
}

class CircularOuterNotchedRectangle extends NotchedShape {
  /// Creates a [CircularOuterNotchedRectangle].
  ///
  /// The same object can be used to create multiple shapes.
  const CircularOuterNotchedRectangle({this.extraOffset = 18.0});

  final double extraOffset;

  /// Creates a [Path] that describes a rectangle with a smooth circular notch.
  ///
  /// `host` is the bounding box for the returned shape. Conceptually this is
  /// the rectangle to which the notch will be applied.
  ///
  /// `guest` is the bounding box of a circle that the notch accommodates. All
  /// points in the circle bounded by `guest` will be outside of the returned
  /// path.
  ///
  /// The notch is curve that smoothly connects the host's top edge and
  /// the guest circle.

  @override
  Path getOuterPath(Rect host, Rect guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    // The guest's shape is a circle bounded by the guest rectangle.
    // So the guest's radius is half the guest width.
    final double notchRadius = guest.width / 2.4;

    // We build a path for the notch from 3 segments:
    // Segment A - a Bezier curve from the host's top edge to segment B.
    // Segment B - an arc with radius notchRadius.
    // Segment C - a Bezier curve from segment B back to the host's top edge.
    //
    // A detailed explanation and the derivation of the formulas below is

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius + extraOffset / 2;
    final double a = -1.0 * r - s2;
    final double b = host.top + guest.center.dy;

    final double n2 = sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = sqrt(r * r - p2xA * p2xA) - extraOffset / 2.5;
    final double p2yB = sqrt(r * r - p2xB * p2xB) - extraOffset / 2.5;
    final List<Offset> p = List<Offset>(6);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    p[2] = p2yA > p2yB ? Offset(p2xA, -p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, -p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) p[i] += guest.center;

    return Path()
      ..moveTo(host.left, -host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, -p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: true,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
