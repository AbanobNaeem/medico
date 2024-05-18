// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pusher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PusherChatModel _$PusherChatModelFromJson(Map<String, dynamic> json) {
  return _PusherChatModel.fromJson(json);
}

/// @nodoc
mixin _$PusherChatModel {
  @JsonKey(name: "SenderID")
  int? get senderID => throw _privateConstructorUsedError;
  @JsonKey(name: "ReceiverID")
  int? get receiverID => throw _privateConstructorUsedError;
  @JsonKey(name: "Content")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "Timestamp")
  String? get timestamp => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PusherChatModelCopyWith<PusherChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PusherChatModelCopyWith<$Res> {
  factory $PusherChatModelCopyWith(
          PusherChatModel value, $Res Function(PusherChatModel) then) =
      _$PusherChatModelCopyWithImpl<$Res, PusherChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "SenderID") int? senderID,
      @JsonKey(name: "ReceiverID") int? receiverID,
      @JsonKey(name: "Content") String? message,
      @JsonKey(name: "Timestamp") String? timestamp,
      String? id});
}

/// @nodoc
class _$PusherChatModelCopyWithImpl<$Res, $Val extends PusherChatModel>
    implements $PusherChatModelCopyWith<$Res> {
  _$PusherChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderID = freezed,
    Object? receiverID = freezed,
    Object? message = freezed,
    Object? timestamp = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      senderID: freezed == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverID: freezed == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PusherChatModelImplCopyWith<$Res>
    implements $PusherChatModelCopyWith<$Res> {
  factory _$$PusherChatModelImplCopyWith(_$PusherChatModelImpl value,
          $Res Function(_$PusherChatModelImpl) then) =
      __$$PusherChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SenderID") int? senderID,
      @JsonKey(name: "ReceiverID") int? receiverID,
      @JsonKey(name: "Content") String? message,
      @JsonKey(name: "Timestamp") String? timestamp,
      String? id});
}

/// @nodoc
class __$$PusherChatModelImplCopyWithImpl<$Res>
    extends _$PusherChatModelCopyWithImpl<$Res, _$PusherChatModelImpl>
    implements _$$PusherChatModelImplCopyWith<$Res> {
  __$$PusherChatModelImplCopyWithImpl(
      _$PusherChatModelImpl _value, $Res Function(_$PusherChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderID = freezed,
    Object? receiverID = freezed,
    Object? message = freezed,
    Object? timestamp = freezed,
    Object? id = freezed,
  }) {
    return _then(_$PusherChatModelImpl(
      senderID: freezed == senderID
          ? _value.senderID
          : senderID // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverID: freezed == receiverID
          ? _value.receiverID
          : receiverID // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PusherChatModelImpl implements _PusherChatModel {
  const _$PusherChatModelImpl(
      {@JsonKey(name: "SenderID") this.senderID,
      @JsonKey(name: "ReceiverID") this.receiverID,
      @JsonKey(name: "Content") this.message,
      @JsonKey(name: "Timestamp") this.timestamp,
      this.id});

  factory _$PusherChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PusherChatModelImplFromJson(json);

  @override
  @JsonKey(name: "SenderID")
  final int? senderID;
  @override
  @JsonKey(name: "ReceiverID")
  final int? receiverID;
  @override
  @JsonKey(name: "Content")
  final String? message;
  @override
  @JsonKey(name: "Timestamp")
  final String? timestamp;
  @override
  final String? id;

  @override
  String toString() {
    return 'PusherChatModel(senderID: $senderID, receiverID: $receiverID, message: $message, timestamp: $timestamp, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PusherChatModelImpl &&
            (identical(other.senderID, senderID) ||
                other.senderID == senderID) &&
            (identical(other.receiverID, receiverID) ||
                other.receiverID == receiverID) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, senderID, receiverID, message, timestamp, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PusherChatModelImplCopyWith<_$PusherChatModelImpl> get copyWith =>
      __$$PusherChatModelImplCopyWithImpl<_$PusherChatModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PusherChatModelImplToJson(
      this,
    );
  }
}

abstract class _PusherChatModel implements PusherChatModel {
  const factory _PusherChatModel(
      {@JsonKey(name: "SenderID") final int? senderID,
      @JsonKey(name: "ReceiverID") final int? receiverID,
      @JsonKey(name: "Content") final String? message,
      @JsonKey(name: "Timestamp") final String? timestamp,
      final String? id}) = _$PusherChatModelImpl;

  factory _PusherChatModel.fromJson(Map<String, dynamic> json) =
      _$PusherChatModelImpl.fromJson;

  @override
  @JsonKey(name: "SenderID")
  int? get senderID;
  @override
  @JsonKey(name: "ReceiverID")
  int? get receiverID;
  @override
  @JsonKey(name: "Content")
  String? get message;
  @override
  @JsonKey(name: "Timestamp")
  String? get timestamp;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$PusherChatModelImplCopyWith<_$PusherChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
