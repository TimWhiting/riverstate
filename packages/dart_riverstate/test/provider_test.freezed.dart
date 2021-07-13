// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'provider_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StateClassTearOff {
  const _$StateClassTearOff();

  InitialState initial({int num = 0}) {
    return InitialState(
      num: num,
    );
  }

  State1 state1(int num) {
    return State1(
      num,
    );
  }

  State2 state2(int num) {
    return State2(
      num,
    );
  }
}

/// @nodoc
const $StateClass = _$StateClassTearOff();

/// @nodoc
mixin _$StateClass {
  int get num => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int num) initial,
    required TResult Function(int num) state1,
    required TResult Function(int num) state2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int num)? initial,
    TResult Function(int num)? state1,
    TResult Function(int num)? state2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(State1 value) state1,
    required TResult Function(State2 value) state2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(State1 value)? state1,
    TResult Function(State2 value)? state2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StateClassCopyWith<StateClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateClassCopyWith<$Res> {
  factory $StateClassCopyWith(
          StateClass value, $Res Function(StateClass) then) =
      _$StateClassCopyWithImpl<$Res>;
  $Res call({int num});
}

/// @nodoc
class _$StateClassCopyWithImpl<$Res> implements $StateClassCopyWith<$Res> {
  _$StateClassCopyWithImpl(this._value, this._then);

  final StateClass _value;
  // ignore: unused_field
  final $Res Function(StateClass) _then;

  @override
  $Res call({
    Object? num = freezed,
  }) {
    return _then(_value.copyWith(
      num: num == freezed
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $InitialStateCopyWith<$Res>
    implements $StateClassCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res>;
  @override
  $Res call({int num});
}

/// @nodoc
class _$InitialStateCopyWithImpl<$Res> extends _$StateClassCopyWithImpl<$Res>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(
      InitialState _value, $Res Function(InitialState) _then)
      : super(_value, (v) => _then(v as InitialState));

  @override
  InitialState get _value => super._value as InitialState;

  @override
  $Res call({
    Object? num = freezed,
  }) {
    return _then(InitialState(
      num: num == freezed
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState({this.num = 0});

  @JsonKey(defaultValue: 0)
  @override
  final int num;

  @override
  String toString() {
    return 'StateClass.initial(num: $num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InitialState &&
            (identical(other.num, num) ||
                const DeepCollectionEquality().equals(other.num, num)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(num);

  @JsonKey(ignore: true)
  @override
  $InitialStateCopyWith<InitialState> get copyWith =>
      _$InitialStateCopyWithImpl<InitialState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int num) initial,
    required TResult Function(int num) state1,
    required TResult Function(int num) state2,
  }) {
    return initial(num);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int num)? initial,
    TResult Function(int num)? state1,
    TResult Function(int num)? state2,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(num);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(State1 value) state1,
    required TResult Function(State2 value) state2,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(State1 value)? state1,
    TResult Function(State2 value)? state2,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements StateClass {
  const factory InitialState({int num}) = _$InitialState;

  @override
  int get num => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialStateCopyWith<InitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $State1CopyWith<$Res> implements $StateClassCopyWith<$Res> {
  factory $State1CopyWith(State1 value, $Res Function(State1) then) =
      _$State1CopyWithImpl<$Res>;
  @override
  $Res call({int num});
}

/// @nodoc
class _$State1CopyWithImpl<$Res> extends _$StateClassCopyWithImpl<$Res>
    implements $State1CopyWith<$Res> {
  _$State1CopyWithImpl(State1 _value, $Res Function(State1) _then)
      : super(_value, (v) => _then(v as State1));

  @override
  State1 get _value => super._value as State1;

  @override
  $Res call({
    Object? num = freezed,
  }) {
    return _then(State1(
      num == freezed
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$State1 implements State1 {
  const _$State1(this.num);

  @override
  final int num;

  @override
  String toString() {
    return 'StateClass.state1(num: $num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is State1 &&
            (identical(other.num, num) ||
                const DeepCollectionEquality().equals(other.num, num)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(num);

  @JsonKey(ignore: true)
  @override
  $State1CopyWith<State1> get copyWith =>
      _$State1CopyWithImpl<State1>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int num) initial,
    required TResult Function(int num) state1,
    required TResult Function(int num) state2,
  }) {
    return state1(num);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int num)? initial,
    TResult Function(int num)? state1,
    TResult Function(int num)? state2,
    required TResult orElse(),
  }) {
    if (state1 != null) {
      return state1(num);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(State1 value) state1,
    required TResult Function(State2 value) state2,
  }) {
    return state1(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(State1 value)? state1,
    TResult Function(State2 value)? state2,
    required TResult orElse(),
  }) {
    if (state1 != null) {
      return state1(this);
    }
    return orElse();
  }
}

abstract class State1 implements StateClass {
  const factory State1(int num) = _$State1;

  @override
  int get num => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $State1CopyWith<State1> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $State2CopyWith<$Res> implements $StateClassCopyWith<$Res> {
  factory $State2CopyWith(State2 value, $Res Function(State2) then) =
      _$State2CopyWithImpl<$Res>;
  @override
  $Res call({int num});
}

/// @nodoc
class _$State2CopyWithImpl<$Res> extends _$StateClassCopyWithImpl<$Res>
    implements $State2CopyWith<$Res> {
  _$State2CopyWithImpl(State2 _value, $Res Function(State2) _then)
      : super(_value, (v) => _then(v as State2));

  @override
  State2 get _value => super._value as State2;

  @override
  $Res call({
    Object? num = freezed,
  }) {
    return _then(State2(
      num == freezed
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$State2 implements State2 {
  const _$State2(this.num);

  @override
  final int num;

  @override
  String toString() {
    return 'StateClass.state2(num: $num)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is State2 &&
            (identical(other.num, num) ||
                const DeepCollectionEquality().equals(other.num, num)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(num);

  @JsonKey(ignore: true)
  @override
  $State2CopyWith<State2> get copyWith =>
      _$State2CopyWithImpl<State2>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int num) initial,
    required TResult Function(int num) state1,
    required TResult Function(int num) state2,
  }) {
    return state2(num);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int num)? initial,
    TResult Function(int num)? state1,
    TResult Function(int num)? state2,
    required TResult orElse(),
  }) {
    if (state2 != null) {
      return state2(num);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(State1 value) state1,
    required TResult Function(State2 value) state2,
  }) {
    return state2(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(State1 value)? state1,
    TResult Function(State2 value)? state2,
    required TResult orElse(),
  }) {
    if (state2 != null) {
      return state2(this);
    }
    return orElse();
  }
}

abstract class State2 implements StateClass {
  const factory State2(int num) = _$State2;

  @override
  int get num => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $State2CopyWith<State2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimerStateTearOff {
  const _$TimerStateTearOff();

  TimerStarted started(Timer timer) {
    return TimerStarted(
      timer,
    );
  }

  TimerStopped stopped() {
    return const TimerStopped();
  }
}

/// @nodoc
const $TimerState = _$TimerStateTearOff();

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Timer timer) started,
    required TResult Function() stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Timer timer)? started,
    TResult Function()? stopped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStarted value) started,
    required TResult Function(TimerStopped value) stopped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStarted value)? started,
    TResult Function(TimerStopped value)? stopped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  final TimerState _value;
  // ignore: unused_field
  final $Res Function(TimerState) _then;
}

/// @nodoc
abstract class $TimerStartedCopyWith<$Res> {
  factory $TimerStartedCopyWith(
          TimerStarted value, $Res Function(TimerStarted) then) =
      _$TimerStartedCopyWithImpl<$Res>;
  $Res call({Timer timer});
}

/// @nodoc
class _$TimerStartedCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $TimerStartedCopyWith<$Res> {
  _$TimerStartedCopyWithImpl(
      TimerStarted _value, $Res Function(TimerStarted) _then)
      : super(_value, (v) => _then(v as TimerStarted));

  @override
  TimerStarted get _value => super._value as TimerStarted;

  @override
  $Res call({
    Object? timer = freezed,
  }) {
    return _then(TimerStarted(
      timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer,
    ));
  }
}

/// @nodoc

class _$TimerStarted implements TimerStarted {
  const _$TimerStarted(this.timer);

  @override
  final Timer timer;

  @override
  String toString() {
    return 'TimerState.started(timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TimerStarted &&
            (identical(other.timer, timer) ||
                const DeepCollectionEquality().equals(other.timer, timer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(timer);

  @JsonKey(ignore: true)
  @override
  $TimerStartedCopyWith<TimerStarted> get copyWith =>
      _$TimerStartedCopyWithImpl<TimerStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Timer timer) started,
    required TResult Function() stopped,
  }) {
    return started(timer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Timer timer)? started,
    TResult Function()? stopped,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(timer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStarted value) started,
    required TResult Function(TimerStopped value) stopped,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStarted value)? started,
    TResult Function(TimerStopped value)? stopped,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class TimerStarted implements TimerState {
  const factory TimerStarted(Timer timer) = _$TimerStarted;

  Timer get timer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerStartedCopyWith<TimerStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStoppedCopyWith<$Res> {
  factory $TimerStoppedCopyWith(
          TimerStopped value, $Res Function(TimerStopped) then) =
      _$TimerStoppedCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimerStoppedCopyWithImpl<$Res> extends _$TimerStateCopyWithImpl<$Res>
    implements $TimerStoppedCopyWith<$Res> {
  _$TimerStoppedCopyWithImpl(
      TimerStopped _value, $Res Function(TimerStopped) _then)
      : super(_value, (v) => _then(v as TimerStopped));

  @override
  TimerStopped get _value => super._value as TimerStopped;
}

/// @nodoc

class _$TimerStopped implements TimerStopped {
  const _$TimerStopped();

  @override
  String toString() {
    return 'TimerState.stopped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TimerStopped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Timer timer) started,
    required TResult Function() stopped,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Timer timer)? started,
    TResult Function()? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStarted value) started,
    required TResult Function(TimerStopped value) stopped,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStarted value)? started,
    TResult Function(TimerStopped value)? stopped,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class TimerStopped implements TimerState {
  const factory TimerStopped() = _$TimerStopped;
}
