import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_state/counter/counter_cubit.dart';
import 'package:bloc_state/cubit/cubit/players_cubit.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => PlayersCubit()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: BlocBuilder<PlayersCubit, PlayersState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                      ),
                      onChanged: (value) {
                        context
                            .read<PlayersCubit>()
                            .filterPlayers(value.trim());
                      },
                    ),
                    Builder(builder: (context) {
                      return BuildPlayersList(players: state.players);
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BuildPlayersList extends StatelessWidget {
  const BuildPlayersList({
    Key? key,
    required this.players,
  }) : super(key: key);

  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(players[index].name),
            subtitle: Text(players[index].country),
          );
        },
        separatorBuilder: (ctx, _) => const Divider(),
        itemCount: players.length,
      ),
    );
  }
}
