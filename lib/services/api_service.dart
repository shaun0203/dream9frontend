import 'dart:convert';
import 'package:http/http.dart' as http;

class DreamAnalysisResult {
  final String analysis;
  final List<String> insights;
  final Map<String, String> symbols;

  DreamAnalysisResult({
    required this.analysis,
    required this.insights,
    required this.symbols,
  });
}

class ApiService {
  static const String _baseUrl = 'http://localhost:8000';

  Future<DreamAnalysisResult> analyzeDream(String dreamText) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/v1/analyze-dream'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'dream_text': dreamText}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return DreamAnalysisResult(
        analysis: data['analysis'],
        insights: List<String>.from(data['insights']),
        symbols: Map<String, String>.from(data['symbols']),
      );
    } else {
      throw Exception('Failed to analyze dream');
    }
  }
}