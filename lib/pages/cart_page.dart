import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of products in the cart
    final List<Map<String, dynamic>> cartItems = [
      {
        'image': 'https://rukminim2.flixcart.com/image/416/416/khavrm80-0/chocolate/5/l/a/269-collection-assorted-chocolates-24-pieces-ferrero-rocher-original-imafxcaxeefygezx.jpeg?q=70&crop=false',
        'name': 'FERRERO ROCHER Collection',
        'price': 18.05, // Price in USD
        'quantity': 2,
      },
      {
        'image': 'https://rukminim2.flixcart.com/image/416/416/ko8xtow0/monitor/t/a/y/d24-20-66aekac1in-lenovo-original-imag2qwzazcdmqtb.jpeg?q=70&crop=false',
        'name': 'Full HD VA Panel 3-Side Near Edgeless',
        'price': 72.15, // Price in USD
        'quantity': 1,
      },
      {
        'image': 'https://rukminim2.flixcart.com/image/416/416/xif0q/perfume/5/t/s/30-valentine-floral-perfume-long-lasting-fragrance-upto-12-hours-original-imah4b9uzgxgyajn.jpeg?q=70&crop=false',
        'name': 'Valentine Floral Perfume',
        'price': 3.32, // Price in USD
        'quantity': 3,
      },
    ];

    const double exchangeRate = 83.0; // USD to INR conversion rate

    // Calculate total price in USD and INR
    double totalPriceUSD = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
    double totalPriceINR = totalPriceUSD * exchangeRate; // Convert to INR

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // List of Cart Items
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _buildCartItem(item, exchangeRate);
              },
            ),
          ),

          // Total Price and Checkout Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Total Price in INR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Price:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹${totalPriceINR.toStringAsFixed(2)}', // Show in INR
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Proceeding to checkout...'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Cart Item Widget with INR Conversion
  Widget _buildCartItem(Map<String, dynamic> item, double exchangeRate) {
    double priceInINR = item['price'] * exchangeRate; // Convert to INR

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item['image'],
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item['name'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '₹${priceInINR.toStringAsFixed(2)}', // Show price in INR
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {},
            ),
            Text(
              item['quantity'].toString(),
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
