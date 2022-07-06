import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vrc_finder/model/entity/location.dart';
part 'locations_state.freezed.dart';

@freezed
abstract class LocationsState with _$LocationsState {
  const factory LocationsState({
    @Default(<Location>[]) List<Location> locations,
  }) = LocationsStateData;
  const factory LocationsState.loading() = LocationsStateLoading;
}