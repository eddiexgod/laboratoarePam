import 'package:flutter/material.dart';
import '../../domain/entities/doctor.dart';

class DoctorListSection extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorListSection({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${doctors.length} founds',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Text('Default', style: TextStyle(fontSize: 16)),
                Icon(Icons.sort),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            doctor.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(doctor.specialty,
                                style: TextStyle(color: Colors.grey[600])),
                            const SizedBox(height: 4),
                            Text(doctor.clinic,
                                style: TextStyle(color: Colors.grey[600])),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 16),
                                const SizedBox(width: 4),
                                Text(doctor.rating),
                                const SizedBox(width: 8),
                                Text('(${doctor.reviews})',
                                    style: TextStyle(color: Colors.grey[600])),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.favorite_border, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}