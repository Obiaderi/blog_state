import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

const names = [
  'Foo',
  'Bar',
  'Baz',
  'Qux',
  'Quux',
  'Corge',
  'Grault',
  'Garply',
  'Waldo',
  'Fred',
  'Plugh',
  'Xyzzy',
  'Thud',
];

// Generate an extemsion that gives ramdom names
extension RandomElemet<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  // 1. Create a method that picks a random name from the list of names.
  // 2. Emit helps to update/produce the state of the cubit.
  void pickRandomName() => emit(names.getRandomElement());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 3. Create an instance of the cubit.
  late final NamesCubit namesCubit;

  @override
  void initState() {
    super.initState();
    // 4. Initialize the cubit.
    namesCubit = NamesCubit();
  }

  @override
  void dispose() {
    super.dispose();
    // 5. Close the cubit.
    namesCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder(
        // 6. Listen to the stream of states from the cubit.
        stream: namesCubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(
            onPressed: () => namesCubit.pickRandomName(),
            child: const Text('Pick a random name'),
          );
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(snapshot.data ?? ''),
                  button,
                ],
              );
            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
