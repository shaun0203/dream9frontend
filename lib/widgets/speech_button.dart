import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dream9frontend/bloc/dream_bloc.dart';

class SpeechButton extends StatelessWidget {
  final TextEditingController controller;

  const SpeechButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DreamBloc, DreamState>(
      listener: (context, state) {
        if (state is DreamSpeechSuccess) {
          controller.text = state.recognizedText;
        }
      },
      child: IconButton(
        icon: const Icon(Icons.mic),
        onPressed: () {
          context.read<DreamBloc>().add(const DreamSpeechEvent());
        },
      ),
    );
  }
}