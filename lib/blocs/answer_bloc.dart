import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class AnswerEvent extends Equatable {
  const AnswerEvent();

  @override
  List<Object> get props => [];
}

class AnswerSubmit extends AnswerEvent {}

class AnswerEdit extends AnswerEvent {}

abstract class AnswerState extends Equatable {
  @override
  List<Object> get props => [];
}

class AnswerInitial extends AnswerState {}

class AnswerSubmitted extends AnswerState {}

class AnswerEditing extends AnswerState {}

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  @override
  AnswerState get initialState => AnswerInitial();

  @override
  Stream<AnswerState> mapEventToState(AnswerEvent event) async* {
    if (event is AnswerSubmit) {
      yield AnswerSubmitted();
    }
    if (event is AnswerEdit) {
      yield AnswerEditing();
    }
  }
}
