import 'package:delivery_app/features/home/data/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<RestaurantModel>(
                  builder: (context, restaurant, child) {
                    return Text(
                      restaurant.deliveryAdress,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openLocationSearchBox(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Yor Location',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter address....'),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              String newAdress = textController.text;
              context.read<RestaurantModel>().setDeliveryAdress(newAdress);
              Navigator.pop(context);

              textController.clear();
            },
          ),
        ],
      ),
    );
  }
}
