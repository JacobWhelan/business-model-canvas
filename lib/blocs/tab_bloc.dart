import 'package:bloc/bloc.dart';
import 'package:business_model_canvas/models/questions_list.dart';
import 'package:equatable/equatable.dart';

abstract class TabEvent extends Equatable {
  final int index;

  const TabEvent(this.index);

  @override
  List<Object> get props => [index];
}

class SubmitEvent extends TabEvent {
  const SubmitEvent(int index) : super(index);
}

class EditEvent extends TabEvent {
  const EditEvent(int index) : super(index);
}

class CancelEvent extends TabEvent {
  const CancelEvent(int index) : super(index);
}

class DeleteEvent extends TabEvent {
  const DeleteEvent(int index) : super(index);
}

abstract class TabState extends Equatable {
  final int index;

  const TabState(this.index);

  @override
  List<Object> get props => [index];
}

class InitialState extends TabState {
  const InitialState(int index) : super(index);
}

class SubmittedState extends TabState {
  const SubmittedState(int index) : super(index);
}

class EditingState extends TabState {
  const EditingState(int index) : super(index);
}

class TabBloc extends Bloc<TabEvent, List<TabState>> {
  @override
  List<TabState> get initialState => List.generate(
      QuestionsList.questionList.length, (index) => InitialState(index));

  @override
  Stream<List<TabState>> mapEventToState(TabEvent event) async* {
    var tempState = List<TabState>.from(state);

    if (event is SubmitEvent || event is CancelEvent) {
      tempState[event.index] = SubmittedState(event.index);
      yield tempState;
    }

    if (event is EditEvent) {
      tempState[event.index] = EditingState(event.index);
      yield tempState;
    }

    if (event is DeleteEvent) {
      tempState[event.index] = InitialState(event.index);
      yield tempState;
    }
  }
}
