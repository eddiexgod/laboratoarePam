import 'package:lab4/domain/entities/medical_center.dart';
import 'package:lab4/domain/repositories/medical_repository.dart';

class GetMedicalCenters {
  final MedicalRepository repository;

  GetMedicalCenters(this.repository);

  Future<List<MedicalCenter>> execute() {
    return repository.getMedicalCenters();
  }
}
