import 'package:flutter/material.dart';

class VendorView extends StatelessWidget {
  VendorView({super.key});

  final List<Map<String, dynamic>> vendors = [
    {
      'name': 'Spicy Spoon',
      'cuisine': 'Indian',
      'avatar': '🍛',
      'dish': 'Butter Chicken',
      'menu': ['Butter Chicken', 'Paneer Tikka', 'Naan', 'Biryani'],
    },
    {
      'name': 'Mama’s Kitchen',
      'cuisine': 'Home-style',
      'avatar': '🥘',
      'dish': 'Mixed Veg Curry',
      'menu': ['Mixed Veg Curry', 'Dal Fry', 'Chapati', 'Rice'],
    },
    {
      'name': 'Curry House',
      'cuisine': 'Nepalese',
      'avatar': '🍲',
      'dish': 'Chicken Momo',
      'menu': ['Chicken Momo', 'Veg Momo', 'Thukpa', 'Aloo Tama'],
    },
    {
      'name': 'Tandoor Express',
      'cuisine': 'Pakistani',
      'avatar': '🍢',
      'dish': 'Seekh Kebab',
      'menu': ['Seekh Kebab', 'Chicken Karahi', 'Paratha', 'Lassi'],
    },
  ];

  void _showMenu(BuildContext context, Map<String, dynamic> vendor) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${vendor['name']} Menu'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in vendor['menu'])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text('• $item'),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showRegisterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Become a Vendor'),
        content: const Text('Vendor registration is a placeholder in this demo.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendors Marketplace'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: vendors.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final vendor = vendors[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(vendor['avatar'], style: const TextStyle(fontSize: 32)),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vendor['name'], style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        Text(vendor['cuisine'], style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.restaurant_menu, size: 18, color: Colors.deepOrange),
                            const SizedBox(width: 4),
                            Text(vendor['dish'], style: const TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _showMenu(context, vendor),
                    child: const Text('View Menu'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showRegisterDialog(context),
        icon: const Icon(Icons.storefront),
        label: const Text('Become a Vendor'),
      ),
    );
  }
}
