import 'dart:async';

import 'package:dart_riverstate/src/provider.dart';
import 'package:dart_riverstate/src/core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'provider_test.freezed.dart';

void main() {}

final testStateMachine =
    StateMachineProvider<MyStateMachine, StateClass>((ref) {
  return MyStateMachine();
});

class MyStateMachine extends StateMachineProvider<StateClass> {
  MyStateMachine() : super(StateClass.initial()) {
    when<InitialState>.on((s) => s.state);
  }
  late final init = ActionProvider<Init>((ref) => Init());
  late final back = ActionProvider<Back>((ref) => Back());
  late final forward = ActionProvider<Forward>((ref) => Forward());
  late final increment = ActionProvider<Increment>((ref) => Increment());
  @override
  List<ActionProvider> get actionProviders => [init, back, forward, increment];
}

@freezed
class StateClass with _$StateClass {
  const factory StateClass.initial({@Default(0) int num}) = InitialState;
  const factory StateClass.state1(int num) = State1;
  const factory StateClass.state2(int num) = State2;

  static final Provider<StateClass> provider = Provider<StateClass>((ref) {
    // ref.on(init).when<InitialState>((s, _) => State1(s.num + 1));

    // ref.on(forward).when<State1>((s, _) => State2(s.num + 1));
    // ref.on(back)
    //   ..when<State1>((s, _) => State2(s.num + 1))
    //   ..when<State2>((s, _) => State1(s.num + 1));

    ref.when<InitialState>().on(init, (s, _) => State1(s.num + 1));
    ref.when<State1>()
      ..on(forward, (s, _) => State2(s.num + 1))
      ..on(back, (s, _) => State2(s.num + 1));

    ref.when<State2>()
      ..on(back, (s, _) {
        ref.act(timer.timerStop, TimerStop());
        return State1(s.num + 1);
      })
      ..on(StateClass.increment, (s, _) => s.copyWith(num: s.num + 1));

    // ref.within<State2, Timer?>(
    //   (s) => s.timer,
    //   (s, t) => s.copyWith(timer: t),
    // )
    //   ..on<TimerStart>(timerStart, (s, t, e) {
    //     t?.cancel();
    //     final timer = Timer.periodic(e.duration, (t) {
    //       ref.act(increment, Increment());
    //     });
    //     return timer;
    //   })
    //   ..on<TimerStop>(timerStop, (s, t, e) {
    //     t?.cancel();
    //     return null;
    //   });

    return StateClass.initial();
  });

  static final init = StateProvider<Init>((ref) => Init());
  static final back = StateProvider<Back>((ref) => Back());
  static final forward = StateProvider<Forward>((ref) => Forward());
  static final TimerProvider timer = TimerProvider(onEvent: (ref) {
    ref.act(increment, Increment());
  });

  // static final timerStart = StateProvider<TimerStart>(
  //     (ref) => TimerStart(Duration(milliseconds: 100)));
  // static final timerStop = StateProvider<TimerStop>((ref) => TimerStop());
  static final increment = StateProvider<Increment>((ref) => Increment());
}

typedef ValueChanged<T> = Function(T);

class TimerProvider {
  TimerProvider({this.onStop, this.onStart, this.onEvent});
  ValueChanged<ProviderRef>? onStop;
  ValueChanged<ProviderRef>? onStart;
  ValueChanged<ProviderRef>? onEvent;
  late final provider = Provider<TimerState>((ref) {
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

  final timerStart = StateProvider<TimerStart>(
      (ref) => TimerStart(Duration(milliseconds: 100)));
  final timerStop = StateProvider<TimerStop>((ref) => TimerStop());
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
