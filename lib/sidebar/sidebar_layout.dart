import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import '../styling.dart';
import 'sidebar_item.dart';

class SidebarLayout extends StatefulWidget {
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> with AfterLayoutMixin{
  int selectedIndex = 1;
  LabeledGlobalKey _bakeryKey = LabeledGlobalKey("bakeryKey");
  LabeledGlobalKey _foodKey = LabeledGlobalKey("foodKey");
  LabeledGlobalKey _drinksKey = LabeledGlobalKey("drinksKey");

  RenderBox renderBox;
  double startYPosition;

  void onTabTap(int index) {
    List<RenderBox> list = [
      _bakeryKey.currentContext.findRenderObject(),
      _foodKey.currentContext.findRenderObject(),
      _drinksKey.currentContext.findRenderObject()
    ];
    setState(() {
      selectedIndex = index;
      renderBox = list[index];
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 120,
          top: 0,
          bottom: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null) ?  0 : startYPosition - 45,
              (startYPosition == null) ? 0 :  startYPosition + 75,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 11,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Icon(
                Icons.apps,
                color: subTextColor,
              ),
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.search,
                color: subTextColor,
              ),
              SizedBox(
                height: 150,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SidebarItem(
                      key: _bakeryKey,
                      text: "Bakery",
                      onTabTap: () {
                        onTabTap(0);
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    SidebarItem(
                      key: _foodKey,
                      text: "Food",
                      onTabTap: () {
                        onTabTap(1);
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    SidebarItem(
                      key: _drinksKey,
                      text: "Drinks",
                      onTabTap: () {
                        onTabTap(2);
                      },
                      isSelected: selectedIndex == 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Transform.rotate(
                angle: -1.58,
                child: Icon(
                  Icons.tune,
                  color: subTextColor,
                ),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      renderBox = _foodKey.currentContext.findRenderObject();
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }
}

class SidebarClipper extends CustomClipper<Path> {
  final double startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    double width = size.width;
    width -= 40;
    double height = size.height;

    Path path = Path()

    //up
    ..moveTo(0, 0)
    ..lineTo(width, 0)

    //custom curve
    ..lineTo(width, startYPosition)
    ..quadraticBezierTo(width + 2, startYPosition + 15, width + 10, startYPosition + 25)
    ..quadraticBezierTo(width + 25, startYPosition + 45, width + 25, startYPosition + 60)
    ..quadraticBezierTo(width + 25, endYPosition - 45, width + 10, endYPosition - 25)
    ..quadraticBezierTo(width + 2, endYPosition - 15, width, endYPosition)

    //down
    ..lineTo(width, height)
    ..lineTo(0, height)

    ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}