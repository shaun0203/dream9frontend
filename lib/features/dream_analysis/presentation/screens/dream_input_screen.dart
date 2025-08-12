import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/widgets/dream_input_field.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/widgets/voice_input_button.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/widgets/analysis_result_display.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/bloc/dream_bloc.dart';

class DreamInputScreen extends StatelessWidget {
  const DreamInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dream Analyzer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const DreamInputField(),
            const SizedBox(height: 20),
            const VoiceInputButton(),
            const SizedBox(height: 30),
            const AnalysisResultDisplay(),
          ],
        ),
      ),
    );
  }
}