import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dream9frontend/features/dream_analysis/domain/usecases/analyze_dream.dart';
import 'package:dream9frontend/core/utils/speech_utils.dart';

part 'dream_event.dart';
part 'dream_state.dart';

class DreamBloc extends Bloc<DreamEvent, DreamState> {
  final AnalyzeDream useCase;
  final SpeechUtils speechUtils;

  DreamBloc({required this.useCase, required this.speechUtils}) : super(DreamInitial()) {
    on<SubmitDreamEvent>(_onSubmitDream);
    on<StartListeningEvent>(_onStartListening);
  }

  Future<void> _onSubmitDream(
    SubmitDreamEvent event,
    Emitter<DreamState> emit,
  ) async {
    emit(DreamLoading());
    final result = await useCase(event.dreamText);
    result.fold(
      (failure) => emit(DreamError(failure.message)),
      (analysis) => emit(DreamLoaded(analysis)),
    );
  }

  void _onStartListening(
    StartListeningEvent event,
    Emitter<DreamState> emit,
  ) {
    speechUtils.listen().listen((text) {
      add(SubmitDreamEvent(text));
    });
  }
}