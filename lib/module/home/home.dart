import 'package:flutter/material.dart';
import 'package:pre_plated/module/custom_order/custom_order_view.dart';
import 'package:pre_plated/module/custom_set_time/custom_set_time.dart';
import 'package:pre_plated/module/favourite/favourite_view.dart';
import 'package:pre_plated/module/profile/profile_view.dart';
import 'package:pre_plated/module/setting/setting_view.dart';
import 'package:pre_plated/module/vendor/vendor_view.dart';
import 'package:pre_plated/module/order/order_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.local_pizza, 'label': 'Pizza'},
      {'icon': Icons.icecream, 'label': 'Dessert'},
      {'icon': Icons.ramen_dining, 'label': 'Noodles'},
      {'icon': Icons.local_cafe, 'label': 'Coffee'},
      {'icon': Icons.set_meal, 'label': 'Meals'},
    ];

    final featured = List.generate(
      6,
      (i) => {
        'title': 'Dish ${i + 1}',
        'subtitle': 'Tasty and fresh',
        'rating': 4.5 - (i % 3) * 0.5,
      },
    );

    return Scaffold(
      // Ensure body resizes when keyboard appears to avoid vertical overflow
      resizeToAvoidBottomInset: true,
      // Standard app drawer with a dummy profile and options
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('khaled Ahtesham'),
              accountEmail: const Text('khaled_Ahtesham@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: const Text('J', style: TextStyle(fontSize: 24)),
              ),
              otherAccountsPictures: const [
                CircleAvatar(child: Icon(Icons.star, size: 16)),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              subtitle: const Text('View your profile'),
              onTap: () {
                // Navigator.of(context).pop();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Profile clicked (placeholder)')),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileView()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Customized food order'),
              subtitle: const Text('anything you want !!'),
              onTap: () {
                // Navigator.of(context).pop();
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Profile clicked (placeholder)')),
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomCurryOrderView(),
                  ),
                );
              },
            ),

            // ListTile(
            //   leading: const Icon(Icons.person_outline),
            //   title: const Text('Set Time and get food'),
            //   subtitle: const Text('set custom time for ordering food!!'),
            //   onTap: () {
            //     // Navigator.of(context).pop();
            //     // ScaffoldMessenger.of(context).showSnackBar(
            //     //   const SnackBar(content: Text('Profile clicked (placeholder)')),
            //     // );
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CustomCurryOrderView(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.storefront),
              title: const Text('Are you a vendor?'),
              subtitle: const Text('Register or manage your vendor account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VendorView()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),

            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('PrePlated'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  // Navigate to order list or cart page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderView()),
                  );
                },
              ),
              // Badge
              Positioned(
                right: 8,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: const Text(
                    '4', // number of orders
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find your next meal',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search dishes, restaurants...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Categories horizontal list
              SizedBox(
                height: 92,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return Column(
                      children: [
                        Material(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: Container(
                              width: 72,
                              height: 72,
                              alignment: Alignment.center,
                              child: Icon(
                                item['icon'] as IconData,
                                size: 32,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 8),
                        FittedBox(child: Text(item['label'] as String)),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Section header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured near you',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(onPressed: () {}, child: const Text('See all')),
                ],
              ),

              const SizedBox(height: 8),

              // Featured list
              Expanded(
                child: ListView.separated(
                  // Add bottom padding so the last item is not obscured by
                  // the bottom navigation bar and to avoid small overflow
                  padding: const EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight + 16,
                  ),
                  itemCount: featured.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = featured[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.fastfood, size: 28),
                        ),
                        title: Text(item['title'] as String),
                        subtitle: Row(
                          children: [
                            Text(item['subtitle'] as String),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text((item['rating'] as double).toString()),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Order'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (i) {
          if (i == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderView()),
            );
          }
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
          }
          if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileView()),
            );
          }
        },
      ),
    );
  }
}
