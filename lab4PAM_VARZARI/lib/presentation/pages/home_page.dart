import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/medical_bloc.dart';
import '../bloc/medical_state.dart';
import '../widgets/categories_section.dart';
import '../widgets/doctor_list_section.dart';
import '../widgets/location_section.dart';
import '../widgets/medical_centers_section.dart';
import '../widgets/search_bar.dart';
import '../widgets/specialist_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<MedicalBloc, MedicalState>(
        builder: (context, state) {
          if (state is MedicalLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MedicalError) {
            return Center(child: Text(state.message));
          } else if (state is MedicalLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LocationSection(),
                    const SizedBox(height: 16),
                    const SearchBarWidget(),
                    const SizedBox(height: 16),
                    const SpecialistBanner(),
                    const SizedBox(height: 16),
                    const CategoriesSection(),
                    const SizedBox(height: 16),
                    MedicalCentersSection(centers: state.centers),
                    const SizedBox(height: 16),
                    DoctorListSection(doctors: state.doctors),
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
