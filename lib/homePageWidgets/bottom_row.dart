import 'package:flutter/material.dart';
import '../styling.dart';

class BottomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipPath(
            clipper: BottomRowClipper(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: selectedColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  '  Add a new recipe  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.5,
                    spreadRadius: 10,
                    color: primaryColor,
                  ),]
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomRowClipper extends CustomClipper<Path> {
  BottomRowClipper();

  @override
  Path getClip(Size size) {

    Path path = Path()

      ..lineTo(0, size.height)
      ..lineTo(size.width-15, size.height)
      ..lineTo(size.width, size.height/2)
      ..lineTo(size.width-15, 0)

      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

