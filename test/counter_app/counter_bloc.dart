import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../lib/counter_app/bloc/counter.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });

    group('Increment', () {

      blocTest<CounterCubit, int>(
        'emits [1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[1],
      );

      blocTest<CounterCubit, int>(
        'emits [1, 2] when state is 0 and Increment is called twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..increment()..increment(),
        expect: () => const <int>[1, 2],
      );

      blocTest<CounterCubit, int>(
        'emits [42] when state is 41',
        build: () => CounterCubit(),
        seed: 41,
        act: (cubit) => cubit.increment(),
        expect: () => const <int>[42],
      );

    });

    group('Decrement', () {

      blocTest<CounterCubit, int>(
        'emits [-1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
        expect: () => const <int>[-1],
      );

      blocTest<CounterCubit, int>(
        'emits [-1, -2] when state is 0 and Increment is called twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..decrement()..decrement(),
        expect: () => const <int>[-1, -2],
      );

      blocTest<CounterCubit, int>(
        'emits [42] when state is 43',
        build: () => CounterCubit(),
        seed: 43,
        act: (cubit) => cubit.decrement(),
        expect: () => const <int>[42],
      );

    });
  });
}
