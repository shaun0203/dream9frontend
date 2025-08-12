part of 'dream_bloc.dart';

abstract class DreamState extends Equatable {
  const DreamState();

  @override
  List<Object> get props => [];
}

class DreamInitial extends DreamState {}

class DreamLoading extends DreamState {}

class DreamSpeechInProgress extends DreamState {}

class DreamSpeechSuccess extends DreamState {
  final String recognizedText;
  
  const DreamSpeechSuccess(this.recognizedText);

  @override
  List<Object> get props => [recognizedText];
}

class DreamAnalysisSuccess extends DreamState {
  final String analysis;
  final List<String> insights;
  final Map<String, String> symbols;
  
  const DreamAnalysisSuccess({
    required this.analysis,
    required this.insights,
    required this.symbols,
  });

  @override
  List<Object> get props => [analysis, insights, symbols];
}

class DreamFailure extends DreamState {
  final String error;
  
  const DreamFailure(this.error);

  @override
  List<Object> get props => [error];
}