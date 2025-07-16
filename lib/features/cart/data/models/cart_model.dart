import 'package:delivery_app/features/home/data/models/food_model.dart';

class CartModel {
  FoodModel foodModel;
  List<Adon> selectedAdons;
  int quantity;

  CartModel({
    required this.foodModel,
    this.quantity = 1,
    required this.selectedAdons,
  });

  double get totalPrice {
    double addonsPrice = selectedAdons.fold(0, (sum, adon) => sum + adon.price);
    return (foodModel.price + addonsPrice) * quantity;
  }
}
