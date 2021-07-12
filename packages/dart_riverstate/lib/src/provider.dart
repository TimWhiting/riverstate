import 'package:riverpod/riverpod.dart';

typedef Handler<State> = void Function(StateMachine<State>);

class StateMachine<State> extends StateNotifier<State> {
  StateMachine(State state) : super(state);
  final Map<Type, Handler<State>> _actionHandlers = {};
  final Map<Type, Handler<State>> _stateHandlers = {};
  void on<Action>(void Function(StateMachine<State>) handler) {
    _actionHandlers[Action] = handler;
  }

  void when<SubState extends State>(
      void Function(StateMachine<SubState>) handler) {
    _stateHandlers[SubState] = handler as Handler<State>;
  }
}

class _StateMachineProvider<SM extends StateMachine<Object?>>
    extends AlwaysAliveProviderBase<SM> {
  _StateMachineProvider(this._create, {required String? name})
      : super(name == null ? null : '$name.StateMachine');

  final Create<SM, ProviderRefBase> _create;

  @override
  SM create(ProviderRefBase ref) {
    final sm = _create(ref);
    ref.onDispose(sm.dispose);
    return sm;
  }

  @override
  bool recreateShouldNotify(SM previousState, SM newState) {
    return true;
  }

  @override
  ProviderElement<SM> createElement() => ProviderElement(this);

  @override
  void setupOverride(SetupOverride setup) => throw UnsupportedError(
      'Cannot override StateMachineProvider.stateMachine');
}

typedef StateMachineProviderRef<SM extends StateMachine, State>
    = ProviderRefBase;

mixin _StateMachineProviderMixin<SM extends StateMachine<Value>, Value>
    on ProviderBase<Value> {
  ProviderBase<SM> get stateMachine;

  @override
  void setupOverride(SetupOverride setup) {
    setup(origin: this, override: this);
    setup(origin: stateMachine, override: stateMachine);
  }

  /// Overrides the behavior of a provider with a value.
  ///
  /// {@macro riverpod.overideWith}
  Override overrideWithValue(SM value) {
    return ProviderOverride((setup) {
      setup(
        origin: stateMachine,
        override: StateProvider<SM>((ref) => value),
      );
      setup(origin: this, override: this);
    });
  }
}

class StateMachineProvider<SM extends StateMachine<State>, State>
    extends AlwaysAliveProviderBase<State> with _StateMachineProviderMixin {
  StateMachineProvider(this._create, {String? name}) : super(name);
  final Create<SM, StateMachineProviderRef<SM, State>> _create;
  @override
  late final AlwaysAliveProviderBase<SM> stateMachine =
      _StateMachineProvider(_create, name: name);

  @override
  State create(ProviderElementBase<State> ref) {
    final notifier = ref.watch(stateMachine);

    void listener(State newState) {
      ref.state = newState;
    }

    final removeListener = notifier.addListener(listener);
    ref.onDispose(removeListener);

    return ref.state;
  }

  @override
  bool recreateShouldNotify(State previousState, State newState) {
    return true;
  }

  /// Overrides the behavior of a provider with a another provider.
  ///
  /// {@macro riverpod.overideWith}
  Override overrideWithProvider(
    StateNotifierProvider<SM, State> provider,
  ) {
    return ProviderOverride((setup) {
      setup(origin: stateMachine, override: provider.notifier);
      setup(origin: this, override: this);
    });
  }

  @override
  ProviderElementBase<State> createElement() => ProviderElement(this);
}
