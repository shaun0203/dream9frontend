part of 'dream_bloc.dart';

abstract class DreamEvent extends Equatable {
  const DreamEvent();

  @override
  List<Object> get props => [];
}

class DreamSubmitEvent extends DreamEvent {
  final String dreamText;
  
  const DreamSubmitEvent(this.dreamText);

  @override
  List<Object> get props => [dreamText];
}

class DreamSpeechEvent extends DreamEvent {
  const DreamSpeechEvent();
}