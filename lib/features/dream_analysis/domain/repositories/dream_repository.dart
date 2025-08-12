import 'package:dream9frontend/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dream9frontend/features/dream_analysis/domain/entities/dream_analysis.dart';

abstract class DreamRepository {
  Future<Either<Failure, DreamAnalysis>> analyzeDream(String dreamText);
}