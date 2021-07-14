import 'dart:async';

import 'package:dart_riverstate/src/provider.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';
part 'provider_test.freezed.dart';

void main() {
  test('', () {
    final container = ProviderContainer();
    final init = container.read(testStateMachine);
    expect(init, StateClass.initial());
    container.read(MyStateMachineProvider.init).act(Init());
    expect(container.read(testStateMachine), State1(1));
  });
}

final testStateMachine = MyStateMachineProvider();

class MyStateMachineProvider extends StateMachineProvider<StateClass> {
  MyStateMachineProvider()
      : super((ref) {
          ref.when<InitialState>().on(init, (s, _) => State1(s.num + 1));
          ref.when<State1>()
            ..on(forward, (s, _) => State2(s.num + 1))
            ..on(back, (s, _) => State2(s.num + 1));

          ref.when<State2>()
            ..on(back, (s, _) {
              ref.act(TimerStateMachine.timerStop, TimerStop());
              return State1(s.num + 1);
            })
            ..on(increment, (s, _) => s.copyWith(num: s.num + 1));
          return StateClass.initial();
        });
  static final init = ActionProvider<Init>((ref) => Init());
  static final back = ActionProvider<Back>((ref) => Back());
  static final forward = ActionProvider<Forward>((ref) => Forward());
  static final increment = ActionProvider<Increment>((ref) => Increment());
  static late final timer = TimerStateMachine(onEvent: (ref) {
    ref.act(increment, Increment());
  });
  @override
  List<ActionProvider> get actionProviders => [init, back, forward, increment];
  @override
  List<StateMachineProvider> get subStates => [timer];
}

@freezed
class StateClass with _$StateClass {
  const factory StateClass.initial({@Default(0) int num}) = InitialState;
  const factory StateClass.state1(int num) = State1;
  const factory StateClass.state2(int num) = State2;
}

typedef ValueChanged<T> = Function(T);

class TimerStateMachine extends StateMachineProvider {
  TimerStateMachine({
    ValueChanged<StateMachineProviderRef>? onStop,
    ValueChanged<StateMachineProviderRef>? onStart,
    ValueChanged<StateMachineProviderRef>? onEvent,
  }) : super((ref) {
          ref.when<TimerStopped>().on<TimerStart>(timerStart, (s, e) {
            onStart?.call(ref);
            final timer = Timer.periodic(e.duration, (t) {
              onEvent?.call(ref);
            });
            return TimerStarted(timer);
          });
          ref.when<TimerStarted>().on<TimerStop>(timerStop, (s, e) {
            s.timer.cancel();
            onStop?.call(ref);
            return TimerStopped();
          });
          return TimerStopped();
        });
  static final timerStart = ActionProvider<TimerStart>(
      (ref) => TimerStart(Duration(milliseconds: 100)));
  static final timerStop = ActionProvider<TimerStop>((ref) => TimerStop());

  @override
  List<ActionProvider> get actionProviders => [timerStart, timerStop];

  @override
  List<StateMachineProvider> get subStates => [];
}

@freezed
class TimerState with _$TimerState {
  const factory TimerState.started(Timer timer) = TimerStarted;
  const factory TimerState.stopped() = TimerStopped;
}

class Init extends Action {}

class Back extends Action {}

class Increment extends Action {}

class Forward extends Action {}

class TimerStart extends Action {
  TimerStart(this.duration);
  final Duration duration;
}

class TimerStop extends Action {}
