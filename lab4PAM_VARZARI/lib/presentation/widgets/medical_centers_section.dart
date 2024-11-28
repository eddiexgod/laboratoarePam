import 'package:flutter/material.dart';
import '../../domain/entities/medical_center.dart';

class MedicalCentersSection extends StatelessWidget {
  final List<MedicalCenter> centers;

  const MedicalCentersSection({super.key, required this.centers});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nearby Medical Centers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: centers.length,
            itemBuilder: (context, index) {
              final center = centers[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.only(right: 10),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(4)),
                          image: DecorationImage(
                            image: AssetImage(center.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          center.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(center.address),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 16),
                            const SizedBox(width: 5),
                            Text('${center.rating} (${center.reviews})'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
