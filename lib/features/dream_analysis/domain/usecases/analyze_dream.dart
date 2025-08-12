import 'package:dream9frontend/core/error/failures.dart';
import 'package:dream9frontend/features/dream_analysis/domain/repositories/dream_repository.dart';
import 'package:fpdart/fpdart.dart';

class AnalyzeDream {
  final DreamRepository repository;

  AnalyzeDream(this.repository);

  Future<Either<Failure, String>> call(String dreamText) async {
    return await repository.analyzeDream(dreamText);
  }
}