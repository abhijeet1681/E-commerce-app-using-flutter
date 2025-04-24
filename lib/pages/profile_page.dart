import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue, // AppBar color
        foregroundColor: Colors.white, // AppBar text and icon color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            _buildProfileHeader(),

            // User Information Section
            _buildUserInfoSection(),

            // Options List Section
            _buildOptionsList(),

            // Logout Button
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  // Profile Header Section
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Profile Picture and Name
          Row(
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/v2/D5603AQGJdDe1e4VZEQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1683207134549?e=2147483647&v=beta&t=d4w2SP0vn0XXZj9xMIrNaUSJjTyxeiaOHKXoQAq5XLM', // Replace with actual image URL
                ),
              ),
              const SizedBox(width: 16),

              // User Name
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abhijeet Jadhav',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Premium Member',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Right Side: Email and Phone
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'abhi@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '+91 8110255374',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Add edit profile functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // User Information Section
  Widget _buildUserInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Address
          _buildInfoRow(Icons.location_on, 'Address', 'Sardar Patel Institute of Technology, Andheri '),
        ],
      ),
    );
  }

  // Info Row Widget
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Options List Section
  Widget _buildOptionsList() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildOptionItem(Icons.settings, 'Settings'),
          const Divider(),
          _buildOptionItem(Icons.shopping_bag, 'Orders'),
          const Divider(),
          _buildOptionItem(Icons.favorite, 'Wishlist'),
          const Divider(),
          _buildOptionItem(Icons.help, 'Help & Support'),
        ],
      ),
    );
  }

  // Option Item Widget
  Widget _buildOptionItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Add functionality for each option
      },
    );
  }

  // Logout Button
  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add logout functionality
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logged out successfully!'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text('Logout'),
      ),
    );
  }
}