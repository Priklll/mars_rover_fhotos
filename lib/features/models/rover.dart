enum Rovers {
  spirit,
  curiosity,
  opportunity
}

extension RoverExtention on Rovers {
  String get name{
    switch (this){
      case Rovers.opportunity : return 'opportunity';
      case Rovers.curiosity : return 'curiosity';
      case Rovers.spirit : return 'spirit';
    }
  }
}