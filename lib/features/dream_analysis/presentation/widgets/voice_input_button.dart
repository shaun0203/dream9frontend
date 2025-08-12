import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/bloc/dream_bloc.dart';

class VoiceInputButton extends StatelessWidget {
  const VoiceInputButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.mic),
      label: const Text('Start Voice Input'),
      onPressed: () {
        context.read<DreamBloc>().add(StartListeningEvent());
      },
    );
  }
}