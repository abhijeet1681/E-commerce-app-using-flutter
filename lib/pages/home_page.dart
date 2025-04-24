import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/product_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            _buildBannerSection(),

            // Categories Section
            _buildCategoriesSection(),

            // Deals of the Day Section
            _buildDealsSection(),

            // Grid of Products
            _buildProductGrid(context), // Pass context here
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://rukminim2.flixcart.com/fk-p-flap/1620/270/image/f8dae5ce006b7d54.jpg?q=20',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.phone_android, 'label': 'Mobiles'},
      {'icon': Icons.laptop, 'label': 'Laptops'},
      {'icon': Icons.tv, 'label': 'TVs'},
      {'icon': Icons.kitchen, 'label': 'Appliances'},
      {'icon': Icons.favorite, 'label': 'Fashion'},
    ];

    return Container(
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Icon(
                categories[index]['icon'],
                size: 40,
                color: const Color.fromARGB(255, 243, 33, 44),
              ),
              const SizedBox(height: 4),
              Text(
                categories[index]['label'],
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDealsSection() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Deals of the Day',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildDealItem('https://rukminim2.flixcart.com/image/416/416/jt8yxe80/stuffed-toy/5/g/z/smltdy-12-fox-original-imafem6txqzkya8w.jpeg?q=70&crop=false', 'Teddy', '₹180'),
                _buildDealItem('https://rukminim2.flixcart.com/image/416/416/xif0q/chocolate/1/k/r/-original-imah8v9j3urthyqh.jpeg?q=70&crop=false', 'Cadbury', '₹450'),
                _buildDealItem('https://rukminim2.flixcart.com/image/416/416/xif0q/fresh-flowers/h/b/w/-original-imahfvhjgkrnm3gu.jpeg?q=70&crop=false', 'Rose', '₹350'),
                _buildDealItem('https://rukminim2.flixcart.com/image/612/612/xif0q/perfume/p/q/c/50-romance-eau-de-parfum-secret-temptation-women-original-imah78q2kra7txpz.jpeg?q=70', 'Perfum', '₹2500'),
                _buildDealItem('https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/l/l/-original-imagtc5fz9spysyk.jpeg?q=70&crop=false', 'iPhone 15', '₹59,999'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDealItem(String imageUrl, String name, String price) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'https://rukminim2.flixcart.com/image/416/416/xif0q/perfume/5/t/s/30-valentine-floral-perfume-long-lasting-fragrance-upto-12-hours-original-imah4b9uzgxgyajn.jpeg?q=70&crop=false',
      'name': 'Valentine Floral Perfume',
      'price': '₹276',
      'description': 'Serenade yourself with the ethereal sensuality and undeniable charm of Valentine This scent has been created to mimic the euphoria and invigorating emotions of young rosy love. Put a spell on those around you with this flirtatiously fruity and delicate scent. ',
    },
    {
      'image': 'https://rukminim2.flixcart.com/image/416/416/khavrm80-0/chocolate/5/l/a/269-collection-assorted-chocolates-24-pieces-ferrero-rocher-original-imafxcaxeefygezx.jpeg?q=70&crop=false',
      'name': 'FERRERO ROCHER Collection',
      'price': '₹1,499',
      'description': 'It is pertinent to note that, actual product packaging and materials may contain more and different information, which may include nutritional information/allergen declaration/special instruction for intended use/warning/directions, health & nutritional claims, etc. We recommend that consumers always read the label carefully before using or consuming any products. Please do not solely rely on the information provided on this website. For additional information, please get in touch with the manufacturer.',
    },
    {
      'image': 'https://rukminim2.flixcart.com/image/416/416/jolseq80/stuffed-toy/t/x/a/cap-teddy-bear-50-giftee-original-imafaaqudazjrh7q.jpeg?q=70&crop=false',
      'name': 'TEDDY BEAR',
      'price': '₹349',
      'description': 'Soft and smooth, this adorable and bright teddy from GIFTEE is extremely sweet and lovable. GIFTEE Stuff Mother & Baby Bear will be instantly liked by your children as they are very cuddly in nature. Lovely Faces With Subtle Smiles With cute faces and subtle smiles, these teddies make sure that your children also smile while playing with them. Eye-Pleasing Colors And The Soft Feel The eye-pleasing and soothing colours of the teddies make them attractive. Your kids will surely hug the teddies as they have a soft and velvety feel.',
    },
    {
      'image': 'https://rukminim2.flixcart.com/image/832/832/ju79hu80/watch/z/f/b/nh19552955bm01-titan-original-imaffdr6u2mhhcf6.jpeg?q=70&crop=false',
      'name': 'Titan BANDHAN Analog Watch',
      'price': '₹7,999',
      'description': 'The brand Titan is celebrated for its close connect with the consumers across different lifestyle categories. Titan wallets, made with timeless craftsmanship, are known for their elegant design, customer centric functional value and premium quality.',
    },
    {
      'image': 'https://rukminim2.flixcart.com/image/416/416/xif0q/headphone/e/a/f/-original-imagtc44nk4b3hfg.jpeg?q=70&crop=false',
      'name': 'Apple AirPods Pro ',
      'price': '₹18,999',
      'description': '2nd generation) with USB-C deliver up to 2x more Active Noise Cancellation than the previous generation, with Transparency mode that enables you to hear the world around you, and all-new Adaptive Audio that dynamically tailors noise control to your environment.',
    },
    {
      'image': 'https://rukminim2.flixcart.com/image/416/416/ko8xtow0/monitor/t/a/y/d24-20-66aekac1in-lenovo-original-imag2qwzazcdmqtb.jpeg?q=70&crop=false',
      'name': 'Full HD VA Panel 3-Side Near Edgeless',
      'price': '₹5,999',
      'description': 'The Lenovo 60.45 cm (23.8) Full HD VA Panel (D24-20) monitor is equipped with AMD FreeSync technology which eliminates gaming roadblocks, such as motion blur and input lags, to facilitate an amazing gaming experience.',
    },
  ];

  return Container(
    margin: const EdgeInsets.all(8),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75, // Adjust this value to control the height of the cards
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to ProductDetailsPage with the product data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: products[index]),
              ),
            );
          },
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container with Fixed Height
                Container(
                  height: 120, // Fixed height for the image container
                  width: double.infinity, // Full width
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      products[index]['image'],
                      fit: BoxFit.cover, // Ensures the image fits the box
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index]['name'],
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        products[index]['price'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
}