import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Dentistry',
      'icon': Icons.medical_services,
      'color': Colors.orangeAccent,
    },
    {
      'name': 'Cardiology',
      'icon': Icons.favorite,
      'color': Colors.redAccent,
    },
    {
      'name': 'Pulmonology',
      'icon': Icons.air,
      'color': Colors.lightBlueAccent,
    },
    {
      'name': 'General',
      'icon': Icons.local_hospital,
      'color': Colors.greenAccent,
    },
    {
      'name': 'Neurology',
      'icon': Icons.psychology,
      'color': Colors.purpleAccent,
    },
    {
      'name': 'Laborator',
      'icon': Icons.science,
      'color': Colors.deepPurpleAccent,
    },
    {
      'name': 'Gastroente..',
      'icon': Icons.health_and_safety,
      'color': Colors.pinkAccent,
    },
    {
      'name': 'Vaccinate',
      'icon': Icons.vaccines,
      'color': Colors.tealAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: categories[index]['color'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    categories[index]['icon'],
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(categories[index]['name']!),
              ],
            );
          },
        ),
      ],
    );
  }
}
