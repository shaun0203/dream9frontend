import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dream9frontend/core/constants/api_constants.dart';
import 'package:dream9frontend/core/error/exceptions.dart';

abstract class RemoteDataSource {
  Future<String> analyzeDream(String dreamText);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<String> analyzeDream(String dreamText) async {
    final response = await client.post(
      Uri.parse('${APIConstants.baseUrl}${APIConstants.analyzeEndpoint}'),
      body: jsonEncode({'text': dreamText}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['analysis'];
    } else {
      throw ServerException(message: 'Analysis failed');
    }
  }
}