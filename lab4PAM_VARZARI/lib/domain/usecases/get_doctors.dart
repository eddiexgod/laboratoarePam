import 'package:lab4/domain/entities/doctor.dart';
import 'package:lab4/domain/repositories/medical_repository.dart';

class GetDoctors {
  final MedicalRepository repository;

  GetDoctors(this.repository);

  Future<List<Doctor>> execute() {
    return repository.getDoctors();
  }
}
