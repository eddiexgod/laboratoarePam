import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/medical_repository_impl.dart';
import 'domain/usecases/get_doctors.dart';
import 'domain/usecases/get_medical_centers.dart';
import 'presentation/bloc/medical_bloc.dart';
import 'presentation/bloc/medical_event.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) {
          final repository = MedicalRepositoryImpl();
          final getDoctors = GetDoctors(repository);
          final getMedicalCenters = GetMedicalCenters(repository);

          return MedicalBloc(
            getDoctors: getDoctors,
            getMedicalCenters: getMedicalCenters,
          )..add(LoadMedicalDataEvent());
        },
        child: const HomePage(),
      ),
    );
  }
}
