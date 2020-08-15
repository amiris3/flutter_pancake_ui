import 'package:flutter/material.dart';
import '../styling.dart';

class TopRow extends StatelessWidget {
  final String imageUrl;
  TopRow({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height /3,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                IconButton(
                  icon: ImageIcon(
                      AssetImage('assets/images/long-arrow-left.png')
                  ),
                  color: subTextColor,
                  iconSize: 30,
                  onPressed: () {Navigator.pop(context);},),
                SizedBox(
                  height: 1,
                ),
                _buildIconCircle(Icons.share),
                _buildIconCircle(Icons.ondemand_video),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  width: 260,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.none,
                        scale: 1.45,
                        alignment: FractionalOffset.bottomLeft),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(160),
                        topLeft: Radius.circular(100),
                        bottomRight: Radius.circular(70)),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildIconCircle(IconData data) {
    return CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Icon(data,
          color: selectedColor,
          size: 19,
        ),
      );
  }

}