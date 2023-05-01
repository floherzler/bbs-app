import 'package:bloc/bloc.dart';
import '../models/player.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<Player> {
  PlayerCubit(Player player) : super(player);

  void toggleOnCourt() {
    emit(Player(
        name: state.name,
        handedness: state.handedness,
        favPosition: state.favPosition,
        courtPosition: state.courtPosition,
        onCourt: !state.onCourt,
        big: state.big));
  }
}
