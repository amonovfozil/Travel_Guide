part of 'region_cubit.dart';

@immutable
abstract class RegionState {
  final List<region> regions;

  RegionState(this.regions);
}

class RegionInitial extends RegionState {
  final List<region> Regions;
  RegionInitial(this.Regions) : super(Regions);
}
