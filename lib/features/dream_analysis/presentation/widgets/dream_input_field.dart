import 'package:flutter/material.dart';

class DreamInputField extends StatelessWidget {
  const DreamInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      decoration: const InputDecoration(
        labelText: 'Describe your dream',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {},
    );
  }
}