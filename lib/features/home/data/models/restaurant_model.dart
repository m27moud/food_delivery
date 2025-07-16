import 'package:delivery_app/features/home/data/models/food_model.dart';
import 'package:flutter/material.dart';

class RestaurantModel extends ChangeNotifier {
  final List<FoodModel> _menu = [
    FoodModel(
      name: 'Classic Cheeseburger',
      image: 'images/burgers/burger1.png',
      price: '\$12.99',
      description:
          'A classic cheeseburger with lettuce, tomato, and onion. Served with a side of fries.',
      category: FoodCategory.burgers,
      avilableAdons: [
        const Adon(name: 'Extra Cheese', price: '\$1.99'),
        const Adon(name: 'Special sauce', price: '\$1.99'),
        const Adon(name: 'Avocado', price: '\$2.99'),
      ],
    ),

    FoodModel(
      name: 'BBQ Bacon Burger',
      image: 'images/burgers/burger2.png',
      price: '\$13.99',
      description:
          'Grilled beef patty with crispy bacon, BBQ sauce, and cheddar cheese.',
      category: FoodCategory.burgers,
      avilableAdons: [
        const Adon(name: 'Grilled Onions', price: '\$1.49'),
        const Adon(name: 'Extra Bacon', price: '\$2.49'),
      ],
    ),

    FoodModel(
      name: 'Spicy Chicken Burger',
      image: 'images/burgers/burger3.png',
      price: '\$11.99',
      description:
          'Crispy spicy chicken breast with lettuce and mayo on a toasted bun.',
      category: FoodCategory.burgers,
      avilableAdons: [
        const Adon(name: 'Jalapeños', price: '\$0.99'),
        const Adon(name: 'Pepper Jack Cheese', price: '\$1.49'),
      ],
    ),

    FoodModel(
      name: 'Chocolate Lava Cake',
      image: 'images/desserts/desserts.png',
      price: '\$6.99',
      description:
          'Warm chocolate cake with a gooey center, served with vanilla ice cream.',
      category: FoodCategory.desserts,
      avilableAdons: [
        const Adon(name: 'Extra Ice Cream', price: '\$1.99'),
        const Adon(name: 'Whipped Cream', price: '\$0.99'),
      ],
    ),

    FoodModel(
      name: 'Strawberry Cheesecake',
      image: 'images/desserts/desserts1.png',
      price: '\$5.99',
      description:
          'Creamy cheesecake topped with fresh strawberries and strawberry syrup.',
      category: FoodCategory.desserts,
      avilableAdons: [const Adon(name: 'Chocolate Drizzle', price: '\$0.99')],
    ),

    FoodModel(
      name: 'Tiramisu',
      image: 'images/desserts/desserts2.png',
      price: '\$6.49',
      description:
          'Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone cream.',
      category: FoodCategory.desserts,
      avilableAdons: [
        const Adon(name: 'Cocoa Powder Topping', price: '\$0.50'),
      ],
    ),

    FoodModel(
      name: 'Coca-Cola',
      image: 'images/drinks/drink.png',
      price: '\$1.99',
      description: 'Refreshing chilled Coca-Cola can.',
      category: FoodCategory.drinks,
      avilableAdons: [
        const Adon(name: 'Extra Ice', price: '\$0.25'),
        const Adon(name: 'Lemon Slice', price: '\$0.50'),
      ],
    ),

    FoodModel(
      name: 'Mango Smoothie',
      image: 'images/drinks/drink2.png',
      price: '\$3.99',
      description: 'Blended mango smoothie with a touch of honey.',
      category: FoodCategory.drinks,
      avilableAdons: [const Adon(name: 'Protein Scoop', price: '\$1.99')],
    ),

    FoodModel(
      name: 'Iced Latte',
      image: 'images/drinks/drink3.png',
      price: '\$4.49',
      description: 'Cold espresso with milk and ice.',
      category: FoodCategory.drinks,
      avilableAdons: [
        const Adon(name: 'Vanilla Syrup', price: '\$0.75'),
        const Adon(name: 'Oat Milk', price: '\$0.99'),
      ],
    ),

    FoodModel(
      name: 'Greek Salad',
      image: 'images/salads/salad.png',
      price: '\$7.99',
      description:
          'Fresh lettuce, tomatoes, cucumbers, olives, and feta cheese with olive oil dressing.',
      category: FoodCategory.salads,
      avilableAdons: [const Adon(name: 'Grilled Chicken', price: '\$2.99')],
    ),

    FoodModel(
      name: 'Caesar Salad',
      image: 'images/salads/salad2.png',
      price: '\$8.49',
      description:
          'Crisp romaine lettuce, croutons, and Caesar dressing topped with parmesan.',
      category: FoodCategory.salads,
      avilableAdons: [
        const Adon(name: 'Anchovies', price: '\$1.49'),
        const Adon(name: 'Extra Parmesan', price: '\$0.99'),
      ],
    ),

    FoodModel(
      name: 'Quinoa Bowl',
      image: 'images/salads/salad3.png',
      price: '\$9.99',
      description:
          'A protein-packed salad with quinoa, chickpeas, spinach, and lemon vinaigrette.',
      category: FoodCategory.salads,
      avilableAdons: [const Adon(name: 'Boiled Egg', price: '\$1.00')],
    ),

    FoodModel(
      name: 'French Fries',
      image: 'images/sides/side1.png',
      price: '\$3.49',
      description: 'Golden crispy fries seasoned with salt.',
      category: FoodCategory.sides,
      avilableAdons: [const Adon(name: 'Cheese Sauce', price: '\$0.99')],
    ),

    FoodModel(
      name: 'Mozzarella Sticks',
      image: 'images/sides/side2.png',
      price: '\$4.99',
      description: 'Fried mozzarella cheese sticks served with marinara sauce.',
      category: FoodCategory.sides,
      avilableAdons: [const Adon(name: 'Extra Marinara', price: '\$0.75')],
    ),

    FoodModel(
      name: 'Onion Rings',
      image: 'images/sides/side3.png',
      price: '\$4.49',
      description: 'Crispy battered onion rings with a side of ranch.',
      category: FoodCategory.sides,
      avilableAdons: [const Adon(name: 'Spicy Mayo', price: '\$0.99')],
    ),
  ];

  List<FoodModel> get menu => _menu;
}
