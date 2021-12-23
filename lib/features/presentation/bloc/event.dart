abstract class RoverEvent {}

class PhotoLoadEvent extends RoverEvent {
  PhotoLoadEvent(this.sol);
  int sol;
}


class PhotoLoadByDate extends RoverEvent {
  PhotoLoadByDate();
}