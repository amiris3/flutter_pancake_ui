import 'package:flutter/material.dart';
import 'bottom_row.dart';
import 'recipes_list.dart';
import 'list_specialties.dart';
import '../styling.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              const Text(
                "Simple way to find",
                style: TextStyle(
                    fontSize: 30,
                    color: mainTextColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              const Text("tasty recipes",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: selectedColor)
              ),
              SizedBox(
                height: 30,
              ),
              ListOfSpecialties(),
              SizedBox(
                height: 30,
              ),
              RecipesList(),
              SizedBox(
                height: 30,
              ),
              BottomRow()
            ],
          )
        ],
      ),
    );
  }
}

