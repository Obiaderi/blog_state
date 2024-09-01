part of 'players_cubit.dart';

// Define a Player model
class Player extends Equatable {
  final String name;
  final String country;

  const Player({required this.name, required this.country});

  static List<Player> get allPlayers {
    return [
      const Player(name: 'Lionel Messi', country: 'Argentina'),
      const Player(name: 'Cristiano Ronaldo', country: 'Portugal'),
      const Player(name: 'Neymar Jr.', country: 'Brazil'),
      const Player(name: 'Kylian Mbappé', country: 'France'),
      const Player(name: 'Harry Kane', country: 'England'),
      const Player(name: 'Kevin De Bruyne', country: 'Belgium'),
      const Player(name: 'Mohamed Salah', country: 'Egypt'),
      const Player(name: 'Robert Lewandowski', country: 'Poland'),
      const Player(name: 'Thiago Alcântara', country: 'Spain'),
      const Player(name: 'Sergio Agüero', country: 'Argentina'),
    ];
  }

  @override
  List<Object> get props => [name, country];
}

// Define the PlayersState
sealed class PlayersState extends Equatable {
  const PlayersState(this.players);

  final List<Player> players;

  @override
  List<Object> get props => [players];
}

// Initial state with default players
class PlayersInitial extends PlayersState {
  const PlayersInitial(List<Player> players) : super(players);
}

// Filtered state
class PlayersFiltered extends PlayersState {
  const PlayersFiltered(List<Player> filteredPlayers) : super(filteredPlayers);
}
