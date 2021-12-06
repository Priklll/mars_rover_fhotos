enum Rover {
  spirit,
  curiosity,
  opportunity
}

extension RoverExtention on Rover {
  String get name{
    switch (this){
      case Rover.opportunity : return 'opportunity';
      case Rover.curiosity : return 'curiosity';
      case Rover.spirit : return 'spirit';
    }
  }
}