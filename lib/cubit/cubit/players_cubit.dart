import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersInitial(Player.allPlayers));

  void filterPlayers(String query) {
    // if (query.isEmpty) {
    //   return resetFilter();
    // }
    List<Player> filteredPlayers = Player.allPlayers
        .where(
            (player) => player.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(PlayersFiltered(filteredPlayers));
  }

  void resetFilter() {
    emit(PlayersInitial(Player.allPlayers));
  }
}
