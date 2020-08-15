
class Ingredient {
  final String imageUrl;
  final String name;
  final String amount;

  Ingredient(this.imageUrl, this.name, this.amount);
}

final List<Ingredient> pancakeIngredients = [
  Ingredient('assets/images/flour.png', 'All-purpose flour', '2 cups'),
  Ingredient('assets/images/milk.png', 'Milk or buttermilk', '1 btl'),
  Ingredient('assets/images/blueberries.png', 'Fresh blueberries', '100 g'),
];