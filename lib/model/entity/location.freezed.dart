// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Location {
  String get id => throw _privateConstructorUsedError;
  List<LimitedUser> get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({String id, List<LimitedUser> users});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<LimitedUser>,
    ));
  }
}

/// @nodoc
abstract class _$$LocationDataCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationDataCopyWith(
          _$LocationData value, $Res Function(_$LocationData) then) =
      __$$LocationDataCopyWithImpl<$Res>;
  @override
  $Res call({String id, List<LimitedUser> users});
}

/// @nodoc
class __$$LocationDataCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$$LocationDataCopyWith<$Res> {
  __$$LocationDataCopyWithImpl(
      _$LocationData _value, $Res Function(_$LocationData) _then)
      : super(_value, (v) => _then(v as _$LocationData));

  @override
  _$LocationData get _value => super._value as _$LocationData;

  @override
  $Res call({
    Object? id = freezed,
    Object? users = freezed,
  }) {
    return _then(_$LocationData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<LimitedUser>,
    ));
  }
}

/// @nodoc

class _$LocationData with DiagnosticableTreeMixin implements LocationData {
  const _$LocationData(
      {this.id = "", final List<LimitedUser> users = const <LimitedUser>[]})
      : _users = users;

  @override
  @JsonKey()
  final String id;
  final List<LimitedUser> _users;
  @override
  @JsonKey()
  List<LimitedUser> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Location(id: $id, users: $users)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Location'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('users', users));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  _$$LocationDataCopyWith<_$LocationData> get copyWith =>
      __$$LocationDataCopyWithImpl<_$LocationData>(this, _$identity);
}

abstract class LocationData implements Location {
  const factory LocationData({final String id, final List<LimitedUser> users}) =
      _$LocationData;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  List<LimitedUser> get users => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$LocationDataCopyWith<_$LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}
