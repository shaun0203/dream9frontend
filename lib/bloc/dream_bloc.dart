import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dream9frontend/services/api_service.dart';
import 'package:dream9frontend/services/speech_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';

part 'dream_event.dart';
part 'dream_state.dart';

class DreamBloc extends Bloc<DreamEvent, DreamState> {
  final ApiService apiService;
  final SpeechService speechService;
  
  DreamBloc()
      : apiService = ApiService(),
        speechService = SpeechService(),
        super(DreamInitial()) {
    on<DreamSubmitEvent>(_onDreamSubmit);
    on<DreamSpeechEvent>(_onDreamSpeech);
  }

  Future<void> _onDreamSubmit(
    DreamSubmitEvent event,
    Emitter<DreamState> emit,
  ) async {
    emit(DreamLoading());
    try {
      final analysis = await apiService.analyzeDream(event.dreamText);
      emit(DreamAnalysisSuccess(
        analysis: analysis.analysis,
        insights: analysis.insights,
        symbols: analysis.symbols,
      ));
    } catch (e) {
      emit(DreamFailure(e.toString()));
    }
  }

  Future<void> _onDreamSpeech(
    DreamSpeechEvent event,
    Emitter<DreamState> emit,
  ) async {
    emit(DreamSpeechInProgress());
    try {
      final recognizedText = await speechService.recognizeSpeech();
      emit(DreamSpeechSuccess(recognizedText));
    } catch (e) {
      emit(DreamFailure(e.toString()));
    }
  }
}