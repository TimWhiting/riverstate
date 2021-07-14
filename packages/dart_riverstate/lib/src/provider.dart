import 'package:riverpod/riverpod.dart';

typedef Handler<State> = void Function(StateMachineProvider<State>);

typedef ActionProvider<T> = StateProvider<T>;

typedef StateMachineProviderRef<State> = StateMachineProviderElement<State>;

abstract class StateMachineProvider<State>
    extends AlwaysAliveProviderBase<State> {
  @override
  void setupOverride(SetupOverride setup) {
    setup(origin: this, override: this);
    for (final action in actionProviders) {
      setup(origin: action, override: action);
    }
    for (final subState in subStates) {
      setup(origin: subState, override: subState);
    }
  }

  StateMachineProvider(this._create, {String? name}) : super(name);
  final Create<State, StateMachineProviderRef<State>> _create;

  @override
  State create(StateMachineProviderElement<State> ref) {
    final value = _create(ref);
    return value;
  }

  @override
  bool recreateShouldNotify(State previousState, State newState) {
    return true;
  }

  /// Overrides the behavior of a provider with a another provider.
  ///
  /// {@macro riverpod.overideWith}
  Override overrideWithProvider(
    StateMachineProvider<State> provider,
  ) {
    return ProviderOverride((setup) {
      setup(origin: this, override: this);
    });
  }

  List<ActionProvider> get actionProviders;
  List<StateMachineProvider> get subStates;

  @override
  ProviderElementBase<State> createElement() =>
      StateMachineProviderElement<State>(this);
}

class StateMachineProviderElement<State> extends ProviderElementBase<State>
    implements ProviderRef<State> {
  StateMachineProviderElement(this.stateMachineProvider)
      : super(stateMachineProvider);
  final StateMachineProvider<State> stateMachineProvider;
  final Map<Type, StateDispatcher<State, State>> _stateHandlers = {};

  StateDispatcher<State, SubState> when<SubState extends State>() {
    _stateHandlers[SubState] ??= StateDispatcher<State, SubState>(this);
    return _stateHandlers[SubState] as StateDispatcher<State, SubState>;
  }

  void act<T extends Object>(StateProvider<T> action, [T? value]) {
    if (value != null) {
      read(action).state = value;
    } else {
      // Trigger update anyways
      read(action).state = read(action).state;
    }
  }

  void actN<T extends Object>(StateProvider<T?> action, [T? value]) {
    read(action).state = value;
  }
}

class StateDispatcher<States, SubState> {
  StateDispatcher(this.ref);
  final StateMachineProviderRef<States> ref;
  void on<Event extends Action>(StateProvider<Event> provider,
      States Function(SubState, Event) transition) {
    ref.listen<StateController<Event>>(provider, (e) {
      final event = e.state;
      if (ref.state is SubState) {
        if (event.once && event.handled) {
          return;
        }
        ref.state = transition(ref.state as SubState, event);
        event.handled = true;
      }
    });
  }
}

class Action {
  final bool once;
  bool handled = false;
  Action({this.once = true});
}

extension ActionProviderExt<Act extends Action> on StateController<Act> {
  void act([Act? value]) {
    if (value != null) {
      state = value;
    } else {
      // Trigger update anyways
      state = state;
    }
  }
}

extension ActionProviderExtNullable<Act extends Action>
    on StateController<Act?> {
  void actN([Act? value]) {
    state = value;
  }
}
