// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'locations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Location> locations) $default, {
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Location> locations)? $default, {
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Location> locations)? $default, {
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(LocationsStateData value) $default, {
    required TResult Function(LocationsStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(LocationsStateData value)? $default, {
    TResult Function(LocationsStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(LocationsStateData value)? $default, {
    TResult Function(LocationsStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationsStateCopyWith<$Res> {
  factory $LocationsStateCopyWith(
          LocationsState value, $Res Function(LocationsState) then) =
      _$LocationsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationsStateCopyWithImpl<$Res>
    implements $LocationsStateCopyWith<$Res> {
  _$LocationsStateCopyWithImpl(this._value, this._then);

  final LocationsState _value;
  // ignore: unused_field
  final $Res Function(LocationsState) _then;
}

/// @nodoc
abstract class _$$LocationsStateDataCopyWith<$Res> {
  factory _$$LocationsStateDataCopyWith(_$LocationsStateData value,
          $Res Function(_$LocationsStateData) then) =
      __$$LocationsStateDataCopyWithImpl<$Res>;
  $Res call({List<Location> locations});
}

/// @nodoc
class __$$LocationsStateDataCopyWithImpl<$Res>
    extends _$LocationsStateCopyWithImpl<$Res>
    implements _$$LocationsStateDataCopyWith<$Res> {
  __$$LocationsStateDataCopyWithImpl(
      _$LocationsStateData _value, $Res Function(_$LocationsStateData) _then)
      : super(_value, (v) => _then(v as _$LocationsStateData));

  @override
  _$LocationsStateData get _value => super._value as _$LocationsStateData;

  @override
  $Res call({
    Object? locations = freezed,
  }) {
    return _then(_$LocationsStateData(
      locations: locations == freezed
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
    ));
  }
}

/// @nodoc

class _$LocationsStateData implements LocationsStateData {
  const _$LocationsStateData(
      {final List<Location> locations = const <Location>[]})
      : _locations = locations;

  final List<Location> _locations;
  @override
  @JsonKey()
  List<Location> get locations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  String toString() {
    return 'LocationsState(locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationsStateData &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_locations));

  @JsonKey(ignore: true)
  @override
  _$$LocationsStateDataCopyWith<_$LocationsStateData> get copyWith =>
      __$$LocationsStateDataCopyWithImpl<_$LocationsStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Location> locations) $default, {
    required TResult Function() loading,
  }) {
    return $default(locations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Location> locations)? $default, {
    TResult Function()? loading,
  }) {
    return $default?.call(locations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Location> locations)? $default, {
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(locations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(LocationsStateData value) $default, {
    required TResult Function(LocationsStateLoading value) loading,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(LocationsStateData value)? $default, {
    TResult Function(LocationsStateLoading value)? loading,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(LocationsStateData value)? $default, {
    TResult Function(LocationsStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class LocationsStateData implements LocationsState {
  const factory LocationsStateData({final List<Location> locations}) =
      _$LocationsStateData;

  List<Location> get locations => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$LocationsStateDataCopyWith<_$LocationsStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationsStateLoadingCopyWith<$Res> {
  factory _$$LocationsStateLoadingCopyWith(_$LocationsStateLoading value,
          $Res Function(_$LocationsStateLoading) then) =
      __$$LocationsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationsStateLoadingCopyWithImpl<$Res>
    extends _$LocationsStateCopyWithImpl<$Res>
    implements _$$LocationsStateLoadingCopyWith<$Res> {
  __$$LocationsStateLoadingCopyWithImpl(_$LocationsStateLoading _value,
      $Res Function(_$LocationsStateLoading) _then)
      : super(_value, (v) => _then(v as _$LocationsStateLoading));

  @override
  _$LocationsStateLoading get _value => super._value as _$LocationsStateLoading;
}

/// @nodoc

class _$LocationsStateLoading implements LocationsStateLoading {
  const _$LocationsStateLoading();

  @override
  String toString() {
    return 'LocationsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LocationsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Location> locations) $default, {
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<Location> locations)? $default, {
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Location> locations)? $default, {
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(LocationsStateData value) $default, {
    required TResult Function(LocationsStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(LocationsStateData value)? $default, {
    TResult Function(LocationsStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(LocationsStateData value)? $default, {
    TResult Function(LocationsStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LocationsStateLoading implements LocationsState {
  const factory LocationsStateLoading() = _$LocationsStateLoading;
}
