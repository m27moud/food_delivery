import 'package:delivery_app/core/widgets/my_quantity_selector.dart';
import 'package:delivery_app/features/cart/data/models/cart_model.dart';
import 'package:delivery_app/features/home/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCartTile extends StatelessWidget {
  final CartModel cartModel;
  const CustomCartTile({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantModel>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      cartModel.foodModel.image,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartModel.foodModel.name),
                      const SizedBox(height: 5),
                      Text('\$${cartModel.foodModel.price}'),
                    ],
                  ),
                  const Spacer(),
                  MyQuantitySelector(
                    quantity: cartModel.quantity,
                    foodModel: cartModel.foodModel,
                    onIncrement: () {
                      restaurant.addToCart(
                        cartModel.foodModel,
                        cartModel.selectedAdons,
                      );
                    },
                    onDecrement: () {
                      restaurant.removeFromCart(cartModel);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: cartModel.selectedAdons.isNotEmpty ? 60 : 0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                children: cartModel.selectedAdons
                    .map(
                      (adon) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Row(
                            children: [
                              Text(adon.name),
                              Text('\$${adon.price}'),
                            ],
                          ),
                          onSelected: (value) {},
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
