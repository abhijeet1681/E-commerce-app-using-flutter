import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class BrowsePage extends StatelessWidget {
  static const double exchangeRate = 83.0; // USD to INR conversion rate

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Valentine Floral Perfume',
      description: 'Serenade yourself with the ethereal sensuality...',
      price: 3.32, // Price in USD
      imageUrl: 'https://rukminim2.flixcart.com/image/416/416/xif0q/perfume/5/t/s/30-valentine-floral-perfume-long-lasting-fragrance-upto-12-hours-original-imah4b9uzgxgyajn.jpeg?q=70&crop=false',
    ),
    Product(
      id: '2',
      name: 'FERRERO ROCHER Collection',
      description: 'It is pertinent to note that...',
      price: 18.05, // Price in USD
      imageUrl: 'https://rukminim2.flixcart.com/image/416/416/khavrm80-0/chocolate/5/l/a/269-collection-assorted-chocolates-24-pieces-ferrero-rocher-original-imafxcaxeefygezx.jpeg?q=70&crop=false',
    ),
    Product(
      id: '3',
      name: 'Full HD VA Panel 3-Side Near Edgeless',
      description: 'The Lenovo 60.45 cm (23.8) Full HD VA Panel...',
      price: 72.15, // Price in USD
      imageUrl: 'https://rukminim2.flixcart.com/image/416/416/ko8xtow0/monitor/t/a/y/d24-20-66aekac1in-lenovo-original-imag2qwzazcdmqtb.jpeg?q=70&crop=false',
    ),
    Product(
      id: '4',
      name: 'Apple AirPods Pro',
      description: '2nd generation with USB-C deliver up to 2x more...',
      price: 228.91, // Price in USD
      imageUrl: 'https://rukminim2.flixcart.com/image/416/416/xif0q/headphone/e/a/f/-original-imagtc44nk4b3hfg.jpeg?q=70&crop=false',
    ),
    Product(
      id: '5',
      name: 'Titan BANDHAN Analog Watch',
      description: 'The brand Titan is celebrated for its close connect...',
      price: 96.38, // Price in USD
      imageUrl: 'https://rukminim2.flixcart.com/image/832/832/ju79hu80/watch/z/f/b/nh19552955bm01-titan-original-imaffdr6u2mhhcf6.jpeg?q=70&crop=false',
    ),
    Product(
      id: '6',
      name: 'TEDDY BEAR',
      description: 'Soft and smooth, this adorable and bright teddy...',
      price: 4.2, // Price in USD
      imageUrl: 'https://rukminim2.flixcart.com/image/416/416/jolseq80/stuffed-toy/t/x/a/cap-teddy-bear-50-giftee-original-imafaaqudazjrh7q.jpeg?q=70&crop=false',
    ),
  ];

  BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return ProductItem(
            product: products[index],
            exchangeRate: exchangeRate, // Pass exchange rate for INR conversion
          );
        },
      ),
    );
  }
}
