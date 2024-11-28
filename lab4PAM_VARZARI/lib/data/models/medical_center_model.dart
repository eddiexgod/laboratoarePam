import 'package:lab4/domain/entities/medical_center.dart';

class MedicalCenterModel extends MedicalCenter {
  MedicalCenterModel({
    required String name,
    required String address,
    required String rating,
    required String reviews,
    required String image,
  }) : super(
          name: name,
          address: address,
          rating: rating,
          reviews: reviews,
          image: image,
        );

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      name: json['name'],
      address: json['address'],
      rating: json['rating'],
      reviews: json['reviews'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'rating': rating,
      'reviews': reviews,
      'image': image,
    };
  }
}
