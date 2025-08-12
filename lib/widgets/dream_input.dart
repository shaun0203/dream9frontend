import 'package:flutter/material.dart';

class DreamInput extends StatelessWidget {
  final TextEditingController controller;

  const DreamInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 8,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Type your dream here or use voice input...',
      ),
    );
  }
}