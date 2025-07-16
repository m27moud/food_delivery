import 'package:delivery_app/core/widgets/custom_buttom.dart';
import 'package:delivery_app/features/home/data/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/data/models/restaurant_model.dart';

class DetailsView extends StatefulWidget {
  final FoodModel foodModel;
  final Map<Adon, bool> selectedAdons = {};
  DetailsView({super.key, required this.foodModel}) {
    for (Adon adon in foodModel.avilableAdons) {
      selectedAdons[adon] = false;
    }
  }

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  void addToCart(FoodModel food, Map<Adon, bool> selectedAdons) {
    Navigator.pop(context);
    List<Adon> currentlySelectedAdon = [];

    for (Adon adon in widget.foodModel.avilableAdons) {
      if (widget.selectedAdons[adon] == true) {
        currentlySelectedAdon.add(adon);
      }
    }
    context.read<RestaurantModel>().addToCart(food, currentlySelectedAdon);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  widget.foodModel.image,
                  fit: BoxFit.cover,
                  height: 300,
                ),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.foodModel.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        widget.foodModel.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        widget.foodModel.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        thickness: 1,
                      ),

                      Text(
                        'Add-ons',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.foodModel.avilableAdons.length,
                          itemBuilder: (context, index) {
                            //get individual adon
                            Adon adon = widget.foodModel.avilableAdons[index];

                            //return adon UI
                            return CheckboxListTile(
                              title: Text(
                                adon.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                adon.price.toString(),
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.inversePrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              value: widget.selectedAdons[adon]!,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAdons[adon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                CustomButtom(
                  text: 'Add to cart',
                  onTap: () =>
                      addToCart(widget.foodModel, widget.selectedAdons),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
