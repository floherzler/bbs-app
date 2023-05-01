import 'dart:math';
import 'package:bbs_app/models/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styled_widget/styled_widget.dart';

import '../cubits/team_cubit.dart';

class BasketballCourt extends StatelessWidget {
  const BasketballCourt({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.95;
    final height = MediaQuery.of(context).size.width * 0.7;
    var players = BlocProvider.of<TeamCubit>(context).state.players;
    return SizedBox(
      width: width,
      height: height,
      // build Stack of court, avatars and basketball
      child: Stack(children: [
        CustomPaint(
          size: MediaQuery.of(context).size,
          painter: CourtPainter(),
        ),
        // build avatars for every Player in provided TeamCubit
        ...players.where((e) => e.onCourt).map((player) {
          return _buildAvatar(
            width * player.courtPosition.x,
            height * player.courtPosition.y,
            player.name,
          );
        }),
        _buildBasketball(
          width * players.where((p) => p.hasBall).first.courtPosition.x,
          height * players.where((p) => p.hasBall).first.courtPosition.y,
          players.where((p) => p.hasBall).first.handedness,
        ),
      ]),
    ).center();
  }

  Widget _buildAvatar(double left, double top, String text) {
    const double radius = 15;
    debugPrint('player $text coordinates: $left, $top');
    return Positioned(
      left: left - radius,
      top: top - radius,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: const Color.fromARGB(255, 7, 96, 168),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBasketball(double left, double top, Handedness handedness) {
    final handOffset = handedness == Handedness.left ? 5 : -20;
    return Positioned(
      left: left + handOffset,
      top: top + 10,
      child: const CircleAvatar(
        radius: 10,
        foregroundImage: AssetImage('assets/images/basketball.jpg'),
      ),
    );
  }
}

class CourtPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final courtRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(courtRect, paint);

    final threePointArc = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width * 0.4,
    );
    canvas.drawArc(threePointArc, -pi, pi, false, paint);

    // draw paint as rectangle
    final paintRect = Rect.fromLTWH(
      size.width * 0.4,
      size.width * 0.535,
      size.width * 0.2,
      size.width * 0.2,
    );
    canvas.drawRect(paintRect, paint);

    // draw hoop circle bottom center
    final hoopCircle = Rect.fromCircle(
      center: Offset(size.width / 2, size.height * 0.97),
      radius: size.width * 0.015,
    );
    canvas.drawArc(hoopCircle, 1, 10, false, paint);

    final freeThrowArc = Rect.fromCircle(
      center: Offset(size.width / 2, size.height * 0.73),
      radius: size.width * 0.1,
    );
    canvas.drawArc(freeThrowArc, -pi, pi, false, paint);

    final restrictedAreaArc = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width * 0.07,
    );
    canvas.drawArc(restrictedAreaArc, -pi, pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
