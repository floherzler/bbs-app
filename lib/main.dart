import 'package:bbs_app/models/team.dart';
import 'package:bbs_app/screens/half_court_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/team_cubit.dart';
import 'models/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Player> players = [
      Player(
          name: '1',
          handedness: Handedness.right,
          favPosition: FavPosition.pointGuard,
          courtPosition: CourtPosition.wingRight,
          onCourt: true,
          hasBall: true,
          big: false),
      Player(
          name: '2',
          handedness: Handedness.right,
          favPosition: FavPosition.shootingGuard,
          courtPosition: CourtPosition.wingLeft,
          onCourt: true,
          hasBall: false,
          big: false),
      Player(
          name: '3',
          handedness: Handedness.right,
          favPosition: FavPosition.smallForward,
          courtPosition: CourtPosition.cornerRight,
          onCourt: true,
          hasBall: false,
          big: false),
      Player(
          name: '4',
          handedness: Handedness.right,
          favPosition: FavPosition.powerForward,
          courtPosition: CourtPosition.cornerLeft,
          onCourt: true,
          hasBall: false,
          big: false),
      Player(
          name: '5',
          handedness: Handedness.right,
          favPosition: FavPosition.center,
          courtPosition: CourtPosition.lowPostRight,
          onCourt: true,
          hasBall: false,
          big: true),
      Player(
          name: '6',
          handedness: Handedness.right,
          favPosition: FavPosition.pointGuard,
          courtPosition: CourtPosition.lowPostLeft,
          onCourt: false,
          hasBall: false,
          big: false),
    ];
    Team team = Team(id: 'bbsHeOL', name: 'BBS Herren OL', players: players);
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => TeamCubit(team))],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BBS App'),
          ),
          body: const BasketballCourt(),
        ),
      ),
    );
  }
}

class BasketballBloc extends Bloc<BasketballEvent, BasketballState> {
  BasketballBloc() : super(BasketballInitial());

  Stream<BasketballState> mapEventToState(BasketballEvent event) async* {
    // TODO: Implement event handling and state updates
  }
}

abstract class BasketballEvent {}

abstract class BasketballState {}

class BasketballInitial extends BasketballState {}
