import 'package:delivery_app/features/home/data/models/food_model.dart';
import 'package:flutter/material.dart';

class CustomFoodTile extends StatelessWidget {
  final FoodModel foodModel;
  final void Function()? onTap;
  const CustomFoodTile({
    super.key,
    required this.foodModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodModel.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${foodModel.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,

                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        foodModel.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(foodModel.image, height: 100),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 20,
          indent: 20,
          thickness: 1,
        ),
      ],
    );
  }
}
