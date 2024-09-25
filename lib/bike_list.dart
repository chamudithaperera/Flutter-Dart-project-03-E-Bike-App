import 'package:flutter/material.dart';
import 'bike_item_card.dart';

class BikeList extends StatelessWidget {
  const BikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        BikeItemCard(
          imageUrl: 'assets/images/e-bike.png',
          title: 'E-Bike E-Duro Pro 7',
          price: 'Rs 97,500',
          discount: '20% Off',
        ),
        BikeItemCard(
          imageUrl: 'assets/images/helmet.png',
          title: 'Road Helmet SHAKO HELMET',
          price: 'Rs 5500',
        ),
        // Add more items similarly
      ],
    );
  }
}
