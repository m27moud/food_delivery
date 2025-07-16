class FoodModel {
  final String name;
  final String image;
  final String price;
  final String description;
  final FoodCategory category;
  List<Adon> avilableAdons;

  FoodModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.avilableAdons,
  });
}

enum FoodCategory { burgers, desserts, drinks, salads, sides }

class Adon {
  final String name;
  final String price;
  const Adon({required this.name, required this.price});
}
