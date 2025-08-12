import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/bloc/dream_bloc.dart';

class AnalysisResultDisplay extends StatelessWidget {
  const AnalysisResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DreamBloc, DreamState>(
      builder: (context, state) {
        if (state is DreamLoading) {
          return const CircularProgressIndicator();
        } else if (state is DreamLoaded) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                state.analysis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          );
        } else if (state is DreamError) {
          return Text('Error: ${state.message}');
        } else {
          return Container();
        }
      },
    );
  }
}