import '../models/player.dart';

class TeamState {
  final String id;
  final String name;
  final List<Player> players;

  TeamState({required this.id, required this.name, required this.players});

  TeamState copyWith({
    String id = 'DefaultPlayerID',
    String name = 'DefaultPlayerName',
    List<Player> players = const [],
  }) {
    return TeamState(
      id: id,
      name: name,
      players: players,
    );
  }
}
