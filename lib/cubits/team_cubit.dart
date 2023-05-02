import 'package:bbs_app/cubits/team_state.dart';
import 'package:bloc/bloc.dart';
import '../models/player.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit(TeamState team) : super(team);

  void shuffleOnCourt() {
    final shuffledPositions = CourtPosition.values.toList()..shuffle();
    //assign random new position to players on court
    final updatedPlayers = state.players.map((player) {
      if (player.onCourt) {
        return Player(
          name: player.name,
          handedness: player.handedness,
          favPosition: player.favPosition,
          courtPosition: shuffledPositions.removeLast(),
          onCourt: true,
          hasBall: player.hasBall,
          big: player.big,
        );
      }
      return player;
    }).toList();
    emit(TeamState(id: state.id, name: state.name, players: updatedPlayers));
  }

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
    emit(TeamState(id: state.id, name: state.name, players: updatedPlayers));
  }
}
