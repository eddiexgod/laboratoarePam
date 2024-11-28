import 'package:equatable/equatable.dart';

abstract class MedicalEvent extends Equatable {
  const MedicalEvent();

  @override
  List<Object> get props => [];
}

class LoadMedicalDataEvent extends MedicalEvent {}
