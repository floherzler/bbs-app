enum Handedness { left, right, both }

enum FavPosition {
  pointGuard,
  shootingGuard,
  smallForward,
  powerForward,
  center
}

enum CourtPosition {
  topOfKey,
  wingRight,
  wingLeft,
  cornerRight,
  cornerLeft,
  lowPostRight,
  lowPostLeft,
  elbowRight,
  elbowLeft,
  highPost
}

// extension to map [CourtPosition] to x and y coordinates
extension CourtPositionExtension on CourtPosition {
  double get x {
    switch (this) {
      case CourtPosition.topOfKey:
        return 0.5;
      case CourtPosition.wingRight:
        return 0.28;
      case CourtPosition.wingLeft:
        return 0.72;
      case CourtPosition.cornerRight:
        return 0.05;
      case CourtPosition.cornerLeft:
        return 0.95;
      case CourtPosition.lowPostRight:
        return 0.65;
      case CourtPosition.lowPostLeft:
        return 0.35;
      case CourtPosition.elbowRight:
        return 0.75;
      case CourtPosition.elbowLeft:
        return 0.25;
      case CourtPosition.highPost:
        return 0.5;
      default:
        return 0.5;
    }
  }

  double get y {
    switch (this) {
      case CourtPosition.topOfKey:
        return 0.3;
      case CourtPosition.wingRight:
        return 0.4;
      case CourtPosition.wingLeft:
        return 0.4;
      case CourtPosition.cornerRight:
        return 0.92;
      case CourtPosition.cornerLeft:
        return 0.92;
      case CourtPosition.lowPostRight:
        return 0.92;
      case CourtPosition.lowPostLeft:
        return 0.92;
      case CourtPosition.elbowRight:
        return 0.5;
      case CourtPosition.elbowLeft:
        return 0.5;
      case CourtPosition.highPost:
        return 0.25;
      default:
        return 0;
    }
  }
}

/// defines a [Player]

class Player {
  final String name;
  final Handedness handedness;
  final FavPosition favPosition;
  CourtPosition courtPosition;
  bool onCourt;
  bool big;

  Player({
    this.name = 'Player',
    this.handedness = Handedness.right,
    this.favPosition = FavPosition.pointGuard,
    this.courtPosition = CourtPosition.wingRight,
    this.onCourt = false,
    this.big = false,
  });
}
