import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavoriteCurry {
  final String vegetable;
  final String protein;
  final String base;
  final DateTime date;
  final TimeOfDay time;
  final String? specification;

  FavoriteCurry({
    required this.vegetable,
    required this.protein,
    required this.base,
    required this.date,
    required this.time,
    this.specification,
  });
}

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  // Dummy favorites data
  final List<FavoriteCurry> favorites = [
    FavoriteCurry(
      vegetable: 'Potato',
      protein: 'Chicken',
      base: 'Rice',
      date: DateTime.now(),
      time: const TimeOfDay(hour: 12, minute: 30),
      specification: "Less spicy",
    ),
    FavoriteCurry(
      vegetable: 'Spinach',
      protein: 'Paneer',
      base: 'Naan',
      date: DateTime.now().add(const Duration(days: 1)),
      time: const TimeOfDay(hour: 19, minute: 0),
      specification: "Extra gravy",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites")),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet 💔",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final fav = favorites[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title row with favorite icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${fav.vegetable} Curry",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // remove from favorites logic
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(Icons.restaurant, size: 18),
                            const SizedBox(width: 6),
                            Text("${fav.protein} • ${fav.base}"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 18),
                            const SizedBox(width: 6),
                            Text(DateFormat.yMMMd().format(fav.date)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 18),
                            const SizedBox(width: 6),
                            Text(fav.time.format(context)),
                          ],
                        ),
                        if (fav.specification != null &&
                            fav.specification!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            "Note: ${fav.specification}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),

                        // Action buttons
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                // reorder logic
                              },
                              icon: const Icon(Icons.shopping_cart_outlined),
                              label: const Text("Reorder"),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: () {
                                // customize again
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text("Customize"),
                            ),
                          ],
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
