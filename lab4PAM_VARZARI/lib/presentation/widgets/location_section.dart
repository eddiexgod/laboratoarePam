import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Location',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text('Seattle, USA', style: TextStyle(fontSize: 16)),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ],
    );
  }
}
