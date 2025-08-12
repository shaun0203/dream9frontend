import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dream9frontend/bloc/dream_bloc.dart';
import 'package:dream9frontend/widgets/dream_input.dart';
import 'package:dream9frontend/widgets/speech_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Dream Analyzer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Describe Your Dream',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DreamInput(controller: controller),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpeechButton(controller: controller),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<DreamBloc>()
                        .add(DreamSubmitEvent(controller.text));
                  },
                  child: const Text('Analyze Dream'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<DreamBloc, DreamState>(
              builder: (context, state) {
                if (state is DreamLoading) {
                  return const CircularProgressIndicator();
                } else if (state is DreamAnalysisSuccess) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Analysis: ${state.analysis}',
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 10),
                          const Text('Key Insights:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          ...state.insights
                              .map((insight) => Text('- $insight'))
                              .toList(),
                        ],
                      ),
                    ),
                  );
                } else if (state is DreamFailure) {
                  return Text('Error: ${state.error}',
                      style: const TextStyle(color: Colors.red));
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}