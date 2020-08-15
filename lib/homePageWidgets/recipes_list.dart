import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../recipe_screen.dart';
import '../styling.dart';

class RecipesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: recipes.length,
          itemBuilder: (context, position) {
          return GestureDetector(
            child: Container(
            height: 385,
            width: 270,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 340,
                          width: 210,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 140,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0, bottom: 3),
                                child: Text(
                                  recipes[position].name.split(" ")[0],
                                  style: TextStyle(
                                    color: mainTextColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Text(
                                  recipes[position].name.split(" ")[1] +
                                      " " +
                                      recipes[position].name.split(" ")[2],
                                  style: TextStyle(
                                    color: subTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 24.0),
                                        child: Text(
                                          recipes[position].calories.toString(),
                                          style: TextStyle(
                                            color: mainTextColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        ' kcal',
                                        style: TextStyle(
                                          color: subTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: Container(
                                      height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                        blurRadius: 10.0,
                                        color: Colors.white,
                                          offset: Offset(0.0, 2.0),
                                        ),
                                      ],
                                    ),
                                      child: Icon(
                                        Icons.bookmark,
                                        color: selectedColor,
                                        size: 13,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(recipes[position].imageUrl),
                        )
                    ),
                  ),
                ),
              ],
            ),
        ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => RecipeScreen(
                  recipe: recipes[position],
                )
              ));
            },
          );}
      ),
    );
  }
}

