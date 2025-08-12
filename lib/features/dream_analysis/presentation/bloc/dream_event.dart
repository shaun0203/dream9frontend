part of 'dream_bloc.dart';

abstract class DreamEvent extends Equatable {
  const DreamEvent();

  @override
  List<Object> get props => [];
}

class SubmitDreamEvent extends DreamEvent {
  final String dreamText;

  const SubmitDreamEvent(this.dreamText);

  @override
  List<Object> get props => [dreamText];
}

class StartListeningEvent extends DreamEvent {}