import 'package:riverpod/riverpod.dart';


// extension ActionResult<States> on ProviderRef<States> {
//   ActionDispatcher<States, Event> on<Event extends Action>(
//     StateProvider<Event> provider, [
//     States Function(States, Event)? transition,
//   ]) {
//     final dispatcher = ActionDispatcher<States, Event>(this);
//     listen<StateController<Event>>(provider, (e) {
//       dispatcher.handle(e.state);
//     });
//     if (transition != null) dispatcher.when<States>(transition);
//     return dispatcher;
//   }

//   StateDispatcher<States, SubState> when<SubState extends States>() {
//     return StateDispatcher<States, SubState>(this);
//   }

//   StateMachineDispatcher<States, SubState, InnerState>
//       within<SubState extends States, InnerState>(
//           InnerState Function(SubState) select,
//           SubState Function(SubState, InnerState) update) {
//     return StateMachineDispatcher<States, SubState, InnerState>(
//         this, select, update);
//   }
// }

// class StateMachineDispatcher<States, SubState extends States, InnerState> {
//   StateMachineDispatcher(this.ref, this.select, this.update);

//   final ProviderRef<States> ref;
//   final InnerState Function(SubState) select;
//   final SubState Function(SubState, InnerState) update;
//   void on<Event extends Action>(StateProvider<Event> provider,
//       InnerState Function(SubState, InnerState, Event) transition) {
//     ref.listen<StateController<Event>>(provider, (e) {
//       final event = e.state;
//       final currentState = ref.state;
//       if (currentState is SubState) {
//         if (event.once && event.handled) {
//           return;
//         }
//         ref.state = update(currentState,
//             transition(currentState, select(currentState), event));
//         event.handled = true;
//       }
//     });
//   }
// }

// class StateDispatcher<States, SubState> {
//   StateDispatcher(this.ref);
//   final ProviderRef<States> ref;
//   void on<Event extends Action>(StateProvider<Event> provider,
//       States Function(SubState, Event) transition) {
//     ref.listen<StateController<Event>>(provider, (e) {
//       final event = e.state;
//       if (ref.state is SubState) {
//         if (event.once && event.handled) {
//           return;
//         }
//         ref.state = transition(ref.state as SubState, event);
//         event.handled = true;
//       }
//     });
//   }
// }

// class ActionDispatcher<States, Event extends Action> {
//   ActionDispatcher(this.ref);
//   final ProviderRef<States> ref;
//   final List<States Function(States, Event)> transitions = [];
//   void when<SubState extends States>(
//       States Function(SubState, Event) transition) {
//     transitions.add((s, event) => s is SubState ? transition(s, event) : s);
//   }

//   void handle(Event e) {
//     if (e.once && e.handled) {
//       return;
//     }
//     var state = ref.state;
//     for (final transition in transitions) {
//       state = transition(state, e);
//       if (state != ref.state) {
//         e.handled = true;
//         // Exit on the first transition that happens
//         break;
//       }
//     }
//     ref.state = state;
//   }
// }

// extension InvokeRef on ProviderRef {
//   void act<T extends Object>(StateProvider<T> action, [T? value]) {
//     if (value != null) {
//       read(action).state = value;
//     } else {
//       // Trigger update anyways
//       read(action).state = read(action).state;
//     }
//   }

//   void actN<T extends Object>(StateProvider<T?> action, [T? value]) {
//     read(action).state = value;
//   }
// }

// extension IsA<T> on T {
//   bool isA<S>(S value) {
//     print(this is S);
//     return this is S;
//   }
// }
