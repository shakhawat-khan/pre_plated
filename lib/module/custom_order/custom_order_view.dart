// import 'package:flutter/material.dart';

// class CustomCurryOrderView extends StatefulWidget {
//   const CustomCurryOrderView({super.key});

//   @override
//   State<CustomCurryOrderView> createState() => _CustomCurryOrderViewState();
// }

// class _CustomCurryOrderViewState extends State<CustomCurryOrderView> {
//   int step = 0;
//   String? selectedVegetable;
//   String? selectedProtein;
//   String? selectedBase;
//   final TextEditingController specificationController = TextEditingController();

//   final vegetables = [
//     'Potato',
//     'Cauliflower',
//     'Spinach',
//     'Eggplant',
//     'Peas',
//     'Mixed Veggies',
//   ];
//   final proteins = ['Chicken', 'Beef', 'Lamb', 'Paneer', 'Tofu', 'No Protein'];
//   final bases = ['Rice', 'Naan', 'Roti', 'Quinoa', 'No Base'];

//   void nextStep() {
//     setState(() {
//       if (step < 2) step++;
//     });
//   }

//   void prevStep() {
//     setState(() {
//       if (step > 0) step--;
//     });
//   }

//   void reset() {
//     setState(() {
//       step = 0;
//       selectedVegetable = null;
//       selectedProtein = null;
//       selectedBase = null;
//       specificationController.clear();
//     });
//   }

//   Widget buildStep({
//     required String title,
//     required List<String> options,
//     required String? selected,
//     required void Function(String) onSelect,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: Theme.of(context).textTheme.titleLarge),
//         const SizedBox(height: 16),
//         Wrap(
//           spacing: 12,
//           runSpacing: 12,
//           children: options
//               .map(
//                 (opt) => ChoiceChip(
//                   label: Text(opt),
//                   selected: selected == opt,
//                   onSelected: (_) => onSelect(opt),
//                 ),
//               )
//               .toList(),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final stepTitles = [
//       'Choose a Vegetable',
//       'Choose a Protein',
//       'Choose a Base',
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Customize Your Curry'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: reset,
//             tooltip: 'Start Over',
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Progress indicator
//             Row(
//               children: List.generate(
//                 3,
//                 (i) => Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(right: i < 2 ? 6 : 0),
//                     height: 6,
//                     decoration: BoxDecoration(
//                       color: i <= step
//                           ? Theme.of(context).colorScheme.primary
//                           : Theme.of(
//                               context,
//                             ).colorScheme.surfaceContainerHighest,
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Step title
//             Text(
//               'Step ${step + 1} of 3',
//               style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//             Text(
//               stepTitles[step],
//               style: Theme.of(
//                 context,
//               ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             // Step card
//             Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Builder(
//                   builder: (_) {
//                     if (step == 0) {
//                       return buildStep(
//                         title: '',
//                         options: vegetables,
//                         selected: selectedVegetable,
//                         onSelect: (v) => setState(() => selectedVegetable = v),
//                       );
//                     } else if (step == 1) {
//                       return buildStep(
//                         title: '',
//                         options: proteins,
//                         selected: selectedProtein,
//                         onSelect: (v) => setState(() => selectedProtein = v),
//                       );
//                     } else {
//                       return buildStep(
//                         title: '',
//                         options: bases,
//                         selected: selectedBase,
//                         onSelect: (v) => setState(() => selectedBase = v),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             // Summary card (only on last step)
//             if (step == 2)
//               Card(
//                 color: Theme.of(context).colorScheme.secondaryContainer,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Your Selection:',
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(Icons.eco, size: 18),
//                           const SizedBox(width: 6),
//                           Text(
//                             selectedVegetable ?? '-',
//                             style: const TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           const Icon(Icons.restaurant, size: 18),
//                           const SizedBox(width: 6),
//                           Text(
//                             selectedProtein ?? '-',
//                             style: const TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           const Icon(Icons.rice_bowl, size: 18),
//                           const SizedBox(width: 6),
//                           Text(
//                             selectedBase ?? '-',
//                             style: const TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Specification (optional):',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       const SizedBox(height: 6),
//                       TextField(
//                         controller: specificationController,
//                         minLines: 1,
//                         maxLines: 3,
//                         decoration: InputDecoration(
//                           hintText: 'e.g. Less spicy, extra gravy, etc.',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 8,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             const Spacer(),
//             Row(
//               children: [
//                 if (step > 0)
//                   TextButton.icon(
//                     icon: const Icon(Icons.arrow_back),
//                     label: const Text('Back'),
//                     onPressed: prevStep,
//                   ),
//                 const Spacer(),
//                 if (step < 2)
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 32,
//                         vertical: 14,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed:
//                         (step == 0 && selectedVegetable == null) ||
//                             (step == 1 && selectedProtein == null)
//                         ? null
//                         : nextStep,
//                     child: const Text('Next'),
//                   ),
//                 if (step == 2)
//                   ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 28,
//                         vertical: 14,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     icon: const Icon(Icons.check),
//                     label: const Text('Place Order'),
//                     onPressed: selectedBase == null
//                         ? null
//                         : () {
//                             showDialog(
//                               context: context,
//                               builder: (ctx) => AlertDialog(
//                                 title: const Text('Order Placed!'),
//                                 content: Text(
//                                   'You ordered a curry with:\n'
//                                   '- Vegetable: $selectedVegetable\n'
//                                   '- Protein: $selectedProtein\n'
//                                   '- Base: $selectedBase\n'
//                                   '- Specification: \'${specificationController.text.isEmpty ? 'None' : specificationController.text}\'',
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(ctx).pop();
//                                       reset();
//                                     },
//                                     child: const Text('OK'),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                   ),
//               ],
//             ),
//             const SizedBox(height: 12),
//           ],
//         ),
//       ),
//     );
//   }
// }
