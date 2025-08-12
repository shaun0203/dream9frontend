import 'package:flutter/material.dart';
import 'package:dream9frontend/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}