part of 'TripPlaces_cubit.dart';

@immutable
abstract class TripPlacesState {
  final List<place> Places;
  TripPlacesState(this.Places);
}

class Initialplaces extends TripPlacesState {
  final List<place> historical;
  Initialplaces(this.historical) : super(historical);
}

class Plasesloaded extends TripPlacesState {
  final List<place> historical;
  Plasesloaded(this.historical) : super(historical);
}

class TogglePlaces extends TripPlacesState {
  final List<place> historical;
  TogglePlaces(this.historical) : super(historical);
}
