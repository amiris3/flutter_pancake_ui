import 'package:flutter/material.dart';
import '../styling.dart';

class ListOfSpecialties  extends StatelessWidget {
  final List<Map> specialties = [
    {'name': "All",
      'icon': ImageIcon(
      AssetImage("assets/images/meal.png"),
      size: 20,
      color: selectedColor,
    )},
    {'name': "Daily",
    'icon': ImageIcon(
      AssetImage("assets/images/daily.png"),
      size: 20,
      color: Colors.white,
    )},
    {'name': "Italian",
    'icon': ImageIcon(
      AssetImage("assets/images/italian.png"),
      size: 20,
      color: selectedColor,
    )},
    {'name': "Asian",
    'icon': ImageIcon(
      AssetImage("assets/images/asian.png"),
      size: 20,
      color: selectedColor,
    )},
    {'name': "Mexican",
    'icon': ImageIcon(
      AssetImage("assets/images/mexican.png"),
      size: 20,
      color: selectedColor,
    )}
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: specialties.length,
        itemBuilder: (context, position) {
          return Padding(
            padding: position == 0 ? const EdgeInsets.only(top: 13, right: 13,
                bottom: 13) : const EdgeInsets.all(13),
            child: Column(
              children: [
                CircleAvatar(
                  child: specialties[position]['icon'],
                  backgroundColor: position == 1 ? selectedColor : primaryColor,
                  radius: 22,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  specialties[position]['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: position == 1 ? selectedColor : subTextColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




