import 'package:flutter/material.dart';
import 'wine.dart';

class WineCard extends StatelessWidget {
  final Wine wine;
  final VoidCallback onFavoriteToggle;

  WineCard({required this.wine, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/${wine.imageUrl}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              wine.name,
              style: TextStyle(fontSize: 20, color: Colors.amberAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              wine.description,
              style: TextStyle(color: Colors.white70),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${wine.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ),
                IconButton(
                  icon: Icon(
                    wine.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: wine.isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
