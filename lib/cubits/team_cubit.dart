import 'package:bloc/bloc.dart';
import '../models/team.dart';
import '../models/player.dart';

class TeamCubit extends Cubit<Team> {
  TeamCubit(Team team) : super(team);

  void substitution(Player inPlayer, Player outPlayer) {
    final updatedPlayers = state.players.map((player) {
      if (player.name == outPlayer.name) {
        return Player(
          name: player.name,
          handedness: player.handedness,
          favPosition: player.favPosition,
          courtPosition: player.courtPosition,
          // to bench
          onCourt: false,
          big: player.big,
        );
      } else if (player.name == inPlayer.name) {
        return Player(
          name: player.name,
          handedness: player.handedness,
          favPosition: player.favPosition,
          // take court position of inPlayer
          courtPosition: inPlayer.courtPosition,
          onCourt: true,
          big: player.big,
        );
      }
      return player;
    }).toList();
    emit(Team(id: state.id, name: state.name, players: updatedPlayers));
  }
}
