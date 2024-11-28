import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lab4/data/models/doctor_model.dart';
import 'package:lab4/domain/entities/doctor.dart';
import 'package:lab4/domain/repositories/medical_repository.dart';

import '../../domain/entities/medical_center.dart';
import '../models/medical_center_model.dart';

class MedicalRepositoryImpl implements MedicalRepository {
  @override
  Future<List<Doctor>> getDoctors() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      final List<dynamic> doctorsJson = data['doctors'];
      return doctorsJson.map((json) => DoctorModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load doctors');
    }
  }

  @override
  Future<List<MedicalCenter>> getMedicalCenters() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      final List<dynamic> centersJson = data['centers'];
      return centersJson
          .map((json) => MedicalCenterModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load medical centers');
    }
  }
}
