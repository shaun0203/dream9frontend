part of 'dream_bloc.dart';

abstract class DreamState extends Equatable {
  const DreamState();

  @override
  List<Object> get props => [];
}

class DreamInitial extends DreamState {}

class DreamLoading extends DreamState {}

class DreamLoaded extends DreamState {
  final String analysis;

  const DreamLoaded(this.analysis);

  @override
  List<Object> get props => [analysis];
}

class DreamError extends DreamState {
  final String message;

  const DreamError(this.message);

  @override
  List<Object> get props => [message];
}