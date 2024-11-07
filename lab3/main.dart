import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'wine.dart';
import 'controllers/wine_controller.dart';


void main() {
  runApp(WineShopApp());
}

class WineShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wine Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WineListScreen(),
    );
  }
}

class WineListScreen extends StatelessWidget {
  final WineController wineController = Get.put(WineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wine Shop'),
      ),
      body: Obx(() {
        if (wineController.wineList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: wineController.wineList.length,
            itemBuilder: (context, index) {
              final wine = wineController.wineList[index];
              return ListTile(
                leading: Image.asset('assets/images/${wine.imageUrl}', width: 50),
                title: Text(wine.name),
                subtitle: Text(wine.description),
              );
            },
          );
        }
      }),
    );
  }
}
