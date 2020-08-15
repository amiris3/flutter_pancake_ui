import 'package:flutter/material.dart';
import 'models/ingredient.dart';
import 'recipeScreenWidgets/top_row.dart';
import 'models/recipe.dart';
import 'styling.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;
  RecipeScreen({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Map> categories = [
      {'name': 'Calories', 'amount': recipe.calories.toString(), 'mesure': 'kcal'},
      {'name': 'Carbo', 'amount': recipe.carbo.toString(), 'mesure': 'g'},
      {'name': 'Protein', 'amount': recipe.protein.toString(), 'mesure': 'g'},
      {'name': 'Fat', 'amount': recipe.fat.toString(), 'mesure': 'g'},
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          TopRow(imageUrl: recipe.imageUrl),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      recipe.name,
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      recipe.desc,
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Nutrition facts",
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (Map map in categories)
                            _buildCategory(map),
                        ],
                      ),
                    ),
                    Text(
                      "Ingredients",
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          for (Ingredient ingredient in recipe.ingredients)
                            _buildIngredient(ingredient),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategory(Map map) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30)
        ),
        width: 60,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 3,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              child: Text(
                  map['amount'],
                style: mainTextStyle,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                map['name'],
              style: mainTextStyle,
            ),
            Text(
                map['mesure'],
              style: subTextStyle,
            ),
            SizedBox(
              height: 3,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIngredient(Ingredient ingredient) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Image(
                    image: AssetImage(ingredient.imageUrl),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                ingredient.name,
                style: mainTextStyle,
              ),
            ],
          ),
          Text(
            ingredient.amount,
            style: subTextStyle,
          ),
        ],
      ),
    );
  }
}

