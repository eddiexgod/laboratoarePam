import 'package:lab4/domain/entities/doctor.dart';
import 'package:lab4/domain/entities/medical_center.dart';
import 'package:equatable/equatable.dart';

abstract class MedicalState extends Equatable {
  const MedicalState();

  @override
  List<Object> get props => [];
}

class MedicalInitial extends MedicalState {}

class MedicalLoading extends MedicalState {}

class MedicalLoaded extends MedicalState {
  final List<Doctor> doctors;
  final List<MedicalCenter> centers;

  const MedicalLoaded({
    required this.doctors,
    required this.centers,
  });

  @override
  List<Object> get props => [doctors, centers];
}

class MedicalError extends MedicalState {
  final String message;

  const MedicalError(this.message);

  @override
  List<Object> get props => [message];
}
