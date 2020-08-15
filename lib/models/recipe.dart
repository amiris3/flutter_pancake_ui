import 'ingredient.dart';

class Recipe {
  final String imageUrl;
  final String name;
  final String desc;
  final int calories;
  final double carbo;
  final double protein;
  final double fat;
  final List<Ingredient> ingredients;

  Recipe(this.imageUrl, this.name, this.desc, this.calories, this.carbo, this.protein,
      this.fat, this.ingredients);
}

final List<Recipe> recipes = [
  Recipe(
    'assets/images/pancakes.png',
    'Pancakes with blueberries',
    'This recipe doesn\'t require much thought early in the morning,'
        'and tastes great!',
    247,
    33.5,
    6.8,
    9.6,
    pancakeIngredients,
  ),
  Recipe(
    'assets/images/pancakes.png',
    'Pie with strawberries',
    'This recipe doesn\'t require much thought early in the morning,'
        'and tastes great!',
    360,
    30.4,
    7.9,
    8.3,
    pancakeIngredients,
  ),
  Recipe(
    'assets/images/pancakes.png',
    'Muffins and eggs',
    'This recipe doesn\'t require much thought early in the morning,'
        'and tastes great!',
    420,
    26.2,
    3.4,
    10.3,
    pancakeIngredients,
  ),
];
