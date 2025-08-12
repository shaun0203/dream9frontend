import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dream9frontend/features/dream_analysis/presentation/screens/dream_input_screen.dart';
import 'package:dream9frontend/injection_container.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Analysis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => di.sl<DreamBloc>(),
        child: const DreamInputScreen(),
      ),
    );
  }
}