import 'package:lab4/domain/usecases/get_doctors.dart';
import 'package:lab4/domain/usecases/get_medical_centers.dart';
import 'package:lab4/presentation/bloc/medical_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'medical_state.dart';

class MedicalBloc extends Bloc<MedicalEvent, MedicalState> {
  final GetDoctors getDoctors;
  final GetMedicalCenters getMedicalCenters;

  MedicalBloc({
    required this.getDoctors,
    required this.getMedicalCenters,
  }) : super(MedicalInitial()) {
    on<LoadMedicalDataEvent>((event, emit) async {
      emit(MedicalLoading());
      try {
        final doctors = await getDoctors.execute();
        final centers = await getMedicalCenters.execute();
        emit(MedicalLoaded(doctors: doctors, centers: centers));
      } catch (e) {
        emit(MedicalError(e.toString()));
      }
    });
  }
}
