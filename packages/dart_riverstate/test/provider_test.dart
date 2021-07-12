import 'package:dart_riverstate/src/provider.dart';

void main() {}

final testStateMachine = StateMachineProvider<MyStateMachine, StateType>((ref) {
  return MyStateMachine();
});

class MyStateMachine extends StateMachine<StateType> {
  MyStateMachine() : super(StateType.initial()) {
    on<StateAction>((s) => s.state);
  }
}

class StateAction {}

class StateType {
  StateType();
  StateType.initial();
}

class SubState extends StateType {
  SubState.initial();
}
