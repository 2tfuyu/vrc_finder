import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    @Default("") String id,
    @Default(<LimitedUser>[]) List<LimitedUser> users
  }) = LocationData;
}