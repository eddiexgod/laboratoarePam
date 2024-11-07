import 'package:flutter/material.dart';
import 'wine.dart';
import 'wine_card.dart';

class WineListScreen extends StatefulWidget {
  @override
  _WineListScreenState createState() => _WineListScreenState();
}

class _WineListScreenState extends State<WineListScreen> {
  String? _selectedType = 'All';
  String? _selectedStyle = 'All';
  String? _selectedCountry = 'All';

  List<Wine> wines = [];
  final List<dynamic> jsonData = json.decode(yourJsonData);
  wines = jsonData.map((jsonItem) => Wine.fromJson(jsonItem)).toList();


  Wine(
      name: 'Ocane Bozovich Benecantano Blanco IGT',
      description: 'Red Wine (Clean and Flinty) from Champagne Blanc...',
      price: 23256.596,
      isAvailable: true,
      imageUrl: 'assets/images/wine1.jpg',
      type: 'Red Wine',
      style: 'Still',
      country: 'France',
    ),
    Wine(
      name: '2021 Petit Chablis - Passy Le Clou',
      description: 'White Wine (Iron and Flint) from Burgundy...',
      price: 23256.596,
      isAvailable: true,
      imageUrl: 'assets/images/wine2.jpg',
      type: 'White Wine',
      style: 'Still',
      country: 'France',
    ),
    Wine(
      name: 'Philippe Fontaine Champagne Brut Rosé',
      description: 'Sparkling Wine from Champagne, France...',
      price: 23256.596,
      isAvailable: false,
      imageUrl: 'assets/images/wine3.jpg',
      type: 'Sparkling Wine',
      style: 'Sparkling',
      country: 'France',
    ),
    Wine(
      name: 'Casa Castillo Monastrell 2019',
      description: 'Red Wine from Jumilla, Spain...',
      price: 18956.49,
      isAvailable: true,
      imageUrl: 'assets/images/wine4.jpg',
      type: 'Red Wine',
      style: 'Still',
      country: 'Spain',
    ),
    Wine(
      name: 'Cannonau di Sardegna 2018',
      description: 'Red Wine from Sardinia, Italy...',
      price: 20567.32,
      isAvailable: true,
      imageUrl: 'assets/images/wine5.jpg',
      type: 'Red Wine',
      style: 'Still',
      country: 'Italy',
    ),
    Wine(
      name: 'Vinho Verde Anselmo Mendes Contacto 2020',
      description: 'White Wine from Vinho Verde, Portugal...',
      price: 15467.89,
      isAvailable: true,
      imageUrl: 'assets/images/wine6.jpg',
      type: 'White Wine',
      style: 'Still',
      country: 'Portugal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Wine> filteredWines = wines.where((wine) {
      final matchesType = _selectedType == 'All' || wine.type == _selectedType;
      final matchesStyle = _selectedStyle == 'All' || wine.style == _selectedStyle;
      final matchesCountry = _selectedCountry == 'All' || wine.country == _selectedCountry;
      return matchesType && matchesStyle && matchesCountry;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Wine Shop'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  hint: Text('Type'),
                  value: _selectedType,
                  items: ['All', 'Red Wine', 'White Wine', 'Sparkling Wine']
                      .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  hint: Text('Style'),
                  value: _selectedStyle,
                  items: ['All', 'Still', 'Sparkling']
                      .map((style) => DropdownMenuItem(
                    value: style,
                    child: Text(style),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStyle = value;
                    });
                  },
                ),
                DropdownButton<String>(
                  hint: Text('Country'),
                  value: _selectedCountry,
                  items: ['All', 'France', 'Italy', 'Spain', 'Portugal']
                      .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWines.length,
              itemBuilder: (context, index) {
                return WineCard(
                  wine: filteredWines[index],
                  onFavoriteToggle: () {
                    setState(() {
                      filteredWines[index].isFavorite = !filteredWines[index].isFavorite;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
