import 'package:lab4/domain/entities/doctor.dart';
import 'package:lab4/domain/entities/medical_center.dart';

abstract class MedicalRepository {
  Future<List<Doctor>> getDoctors();
  Future<List<MedicalCenter>> getMedicalCenters();
}