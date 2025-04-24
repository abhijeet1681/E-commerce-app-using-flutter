import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final double exchangeRate;

  const ProductItem({
    super.key,
    required this.product,
    required this.exchangeRate,
  });

  @override
  Widget build(BuildContext context) {
    double priceInINR = product.price * exchangeRate; // Convert price to INR

    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '₹${priceInINR.toStringAsFixed(2)}', // Show price in INR
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${product.name} added to cart!')),
            );
          },
        ),
      ),
    );
  }
}
