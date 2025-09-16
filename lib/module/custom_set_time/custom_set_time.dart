import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCurryOrderView extends StatefulWidget {
  const CustomCurryOrderView({super.key});

  @override
  State<CustomCurryOrderView> createState() => _CustomCurryOrderViewState();
}

class _CustomCurryOrderViewState extends State<CustomCurryOrderView> {
  int step = 0;
  String? selectedVegetable;
  String? selectedProtein;
  String? selectedBase;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController specificationController = TextEditingController();

  final vegetables = [
    'Potato',
    'Cauliflower',
    'Spinach',
    'Eggplant',
    'Peas',
    'Mixed Veggies',
  ];
  final proteins = ['Chicken', 'Beef', 'Lamb', 'Paneer', 'Tofu', 'No Protein'];
  final bases = ['Rice', 'Naan', 'Roti', 'Quinoa', 'No Base'];

  void nextStep() {
    setState(() {
      if (step < 3) step++;
    });
  }

  void prevStep() {
    setState(() {
      if (step > 0) step--;
    });
  }

  void reset() {
    setState(() {
      step = 0;
      selectedVegetable = null;
      selectedProtein = null;
      selectedBase = null;
      selectedDate = null;
      selectedTime = null;
      specificationController.clear();
    });
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final now = TimeOfDay.now();
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? now,
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  Widget buildStep({
    required String title,
    required List<String> options,
    required String? selected,
    required void Function(String) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: options
              .map(
                (opt) => ChoiceChip(
                  label: Text(opt),
                  selected: selected == opt,
                  onSelected: (_) => onSelect(opt),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final stepTitles = [
      'Choose a Vegetable',
      'Choose a Protein',
      'Choose a Base',
      'Set Delivery Date & Time',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Your Curry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: reset,
            tooltip: 'Start Over',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            Row(
              children: List.generate(
                4,
                (i) => Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: i < 3 ? 6 : 0),
                    height: 6,
                    decoration: BoxDecoration(
                      color: i <= step
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Step title
            Text(
              'Step ${step + 1} of 4',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              stepTitles[step],
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Step content
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Builder(
                  builder: (_) {
                    if (step == 0) {
                      return buildStep(
                        title: '',
                        options: vegetables,
                        selected: selectedVegetable,
                        onSelect: (v) => setState(() => selectedVegetable = v),
                      );
                    } else if (step == 1) {
                      return buildStep(
                        title: '',
                        options: proteins,
                        selected: selectedProtein,
                        onSelect: (v) => setState(() => selectedProtein = v),
                      );
                    } else if (step == 2) {
                      return buildStep(
                        title: '',
                        options: bases,
                        selected: selectedBase,
                        onSelect: (v) => setState(() => selectedBase = v),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Quick selection chips
                          Wrap(
                            spacing: 10,
                            children: [
                              ChoiceChip(
                                label: const Text("Today"),
                                selected:
                                    selectedDate != null &&
                                    DateUtils.isSameDay(
                                      selectedDate,
                                      DateTime.now(),
                                    ),
                                onSelected: (_) {
                                  setState(() {
                                    selectedDate = DateTime.now();
                                  });
                                },
                              ),
                              ChoiceChip(
                                label: const Text("Tomorrow"),
                                selected:
                                    selectedDate != null &&
                                    DateUtils.isSameDay(
                                      selectedDate,
                                      DateTime.now().add(
                                        const Duration(days: 1),
                                      ),
                                    ),
                                onSelected: (_) {
                                  setState(() {
                                    selectedDate = DateTime.now().add(
                                      const Duration(days: 1),
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Calendar button
                          ElevatedButton.icon(
                            onPressed: pickDate,
                            icon: const Icon(Icons.calendar_today),
                            label: const Text('Pick Date'),
                          ),
                          const SizedBox(height: 12),
                          if (selectedDate != null)
                            Text(
                              'Selected Date: ${DateFormat.yMMMd().format(selectedDate!)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          const Divider(height: 30),

                          ElevatedButton.icon(
                            onPressed: pickTime,
                            icon: const Icon(Icons.access_time),
                            label: const Text('Pick Time'),
                          ),
                          const SizedBox(height: 12),
                          if (selectedTime != null)
                            Text(
                              'Selected Time: ${selectedTime!.format(context)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Summary card (only on last step)
            if (step == 3)
              Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Selection:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.eco, size: 18),
                          const SizedBox(width: 6),
                          Text(selectedVegetable ?? '-'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.restaurant, size: 18),
                          const SizedBox(width: 6),
                          Text(selectedProtein ?? '-'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.rice_bowl, size: 18),
                          const SizedBox(width: 6),
                          Text(selectedBase ?? '-'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            selectedDate != null
                                ? DateFormat.yMMMd().format(selectedDate!)
                                : '-',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            selectedTime != null
                                ? selectedTime!.format(context)
                                : '-',
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text('Specification (optional):'),
                      TextField(
                        controller: specificationController,
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'e.g. Less spicy, extra gravy, etc.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const Spacer(),

            // Navigation buttons
            Row(
              children: [
                if (step > 0)
                  TextButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    onPressed: prevStep,
                  ),
                const Spacer(),
                if (step < 3)
                  ElevatedButton(
                    onPressed:
                        (step == 0 && selectedVegetable == null) ||
                            (step == 1 && selectedProtein == null) ||
                            (step == 2 && selectedBase == null)
                        ? null
                        : nextStep,
                    child: const Text('Next'),
                  ),
                if (step == 3)
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text('Place Order'),
                    onPressed: selectedDate == null || selectedTime == null
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Order Placed!'),
                                content: Text(
                                  'You ordered a curry with:\n'
                                  '- Vegetable: $selectedVegetable\n'
                                  '- Protein: $selectedProtein\n'
                                  '- Base: $selectedBase\n'
                                  '- Date: ${DateFormat.yMMMd().format(selectedDate!)}\n'
                                  '- Time: ${selectedTime!.format(context)}\n'
                                  '- Specification: ${specificationController.text.isEmpty ? 'None' : specificationController.text}',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                      reset();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
