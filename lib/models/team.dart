import 'player.dart';

class Team {
  final String id;
  final String name;
  final List<Player> players;

  Team({required this.id, required this.name, required this.players});
}
