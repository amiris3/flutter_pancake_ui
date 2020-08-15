import 'package:flutter/material.dart';
import '../styling.dart';

class SidebarItem extends StatelessWidget {
  final isSelected;
  final String text;
  final Function onTabTap;

  const SidebarItem({
    Key key,
    this.isSelected,
    this.text,
    this.onTabTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: GestureDetector(
        onTap: onTabTap,
        child: Column(
          children: <Widget>[
            AnimatedDefaultTextStyle(
              child: Text(
                text,
              ),
              duration: const Duration(
                  milliseconds: 200),
              style: TextStyle(
                fontSize: 19,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w500,
                color: isSelected ? mainTextColor : subTextColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? selectedColor : Colors.transparent
              ),
            ),
          ],
        ),
      ),
    );
  }

}