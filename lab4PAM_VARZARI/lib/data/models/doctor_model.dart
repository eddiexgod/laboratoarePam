import 'package:lab4/domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String name,
    required String specialty,
    required String clinic,
    required String rating,
    required String reviews,
    required String image,
  }) : super(
          name: name,
          specialty: specialty,
          clinic: clinic,
          rating: rating,
          reviews: reviews,
          image: image,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      specialty: json['specialty'],
      clinic: json['clinic'],
      rating: json['rating'],
      reviews: json['reviews'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'clinic': clinic,
      'rating': rating,
      'reviews': reviews,
      'image': image,
    };
  }
}