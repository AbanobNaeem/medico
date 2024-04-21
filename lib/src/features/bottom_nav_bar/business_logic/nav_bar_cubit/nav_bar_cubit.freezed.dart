// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavBarState {
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavBarStateCopyWith<NavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarStateCopyWith<$Res> {
  factory $NavBarStateCopyWith(
          NavBarState value, $Res Function(NavBarState) then) =
      _$NavBarStateCopyWithImpl<$Res, NavBarState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$NavBarStateCopyWithImpl<$Res, $Val extends NavBarState>
    implements $NavBarStateCopyWith<$Res> {
  _$NavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentIndexImplCopyWith<$Res>
    implements $NavBarStateCopyWith<$Res> {
  factory _$$CurrentIndexImplCopyWith(
          _$CurrentIndexImpl value, $Res Function(_$CurrentIndexImpl) then) =
      __$$CurrentIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$CurrentIndexImplCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$CurrentIndexImpl>
    implements _$$CurrentIndexImplCopyWith<$Res> {
  __$$CurrentIndexImplCopyWithImpl(
      _$CurrentIndexImpl _value, $Res Function(_$CurrentIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$CurrentIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CurrentIndexImpl implements _CurrentIndex {
  const _$CurrentIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'NavBarState.currentIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentIndexImplCopyWith<_$CurrentIndexImpl> get copyWith =>
      __$$CurrentIndexImplCopyWithImpl<_$CurrentIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) currentIndex,
  }) {
    return currentIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? currentIndex,
  }) {
    return currentIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? currentIndex,
    required TResult orElse(),
  }) {
    if (currentIndex != null) {
      return currentIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CurrentIndex value) currentIndex,
  }) {
    return currentIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CurrentIndex value)? currentIndex,
  }) {
    return currentIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CurrentIndex value)? currentIndex,
    required TResult orElse(),
  }) {
    if (currentIndex != null) {
      return currentIndex(this);
    }
    return orElse();
  }
}

abstract class _CurrentIndex implements NavBarState {
  const factory _CurrentIndex({required final int index}) = _$CurrentIndexImpl;

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$CurrentIndexImplCopyWith<_$CurrentIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
