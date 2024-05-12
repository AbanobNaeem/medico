// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DoctorChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorChatStateCopyWith<$Res> {
  factory $DoctorChatStateCopyWith(
          DoctorChatState value, $Res Function(DoctorChatState) then) =
      _$DoctorChatStateCopyWithImpl<$Res, DoctorChatState>;
}

/// @nodoc
class _$DoctorChatStateCopyWithImpl<$Res, $Val extends DoctorChatState>
    implements $DoctorChatStateCopyWith<$Res> {
  _$DoctorChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DoctorChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DoctorChatState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DoctorChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$DoctorChatStateCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SendMessageImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DoctorChatState.sendMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements DoctorChatState {
  const factory _SendMessage({required final String message}) =
      _$SendMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatLoadingImplCopyWith<$Res> {
  factory _$$ChatLoadingImplCopyWith(
          _$ChatLoadingImpl value, $Res Function(_$ChatLoadingImpl) then) =
      __$$ChatLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatLoadingImplCopyWithImpl<$Res>
    extends _$DoctorChatStateCopyWithImpl<$Res, _$ChatLoadingImpl>
    implements _$$ChatLoadingImplCopyWith<$Res> {
  __$$ChatLoadingImplCopyWithImpl(
      _$ChatLoadingImpl _value, $Res Function(_$ChatLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatLoadingImpl implements _ChatLoading {
  const _$ChatLoadingImpl();

  @override
  String toString() {
    return 'DoctorChatState.chatLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) {
    return chatLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) {
    return chatLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) {
    return chatLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) {
    return chatLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (chatLoading != null) {
      return chatLoading(this);
    }
    return orElse();
  }
}

abstract class _ChatLoading implements DoctorChatState {
  const factory _ChatLoading() = _$ChatLoadingImpl;
}

/// @nodoc
abstract class _$$ChatLoadedImplCopyWith<$Res> {
  factory _$$ChatLoadedImplCopyWith(
          _$ChatLoadedImpl value, $Res Function(_$ChatLoadedImpl) then) =
      __$$ChatLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatModel> listOfChat});
}

/// @nodoc
class __$$ChatLoadedImplCopyWithImpl<$Res>
    extends _$DoctorChatStateCopyWithImpl<$Res, _$ChatLoadedImpl>
    implements _$$ChatLoadedImplCopyWith<$Res> {
  __$$ChatLoadedImplCopyWithImpl(
      _$ChatLoadedImpl _value, $Res Function(_$ChatLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfChat = null,
  }) {
    return _then(_$ChatLoadedImpl(
      listOfChat: null == listOfChat
          ? _value._listOfChat
          : listOfChat // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
    ));
  }
}

/// @nodoc

class _$ChatLoadedImpl implements _ChatLoaded {
  const _$ChatLoadedImpl({required final List<ChatModel> listOfChat})
      : _listOfChat = listOfChat;

  final List<ChatModel> _listOfChat;
  @override
  List<ChatModel> get listOfChat {
    if (_listOfChat is EqualUnmodifiableListView) return _listOfChat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfChat);
  }

  @override
  String toString() {
    return 'DoctorChatState.chatLoaded(listOfChat: $listOfChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._listOfChat, _listOfChat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listOfChat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatLoadedImplCopyWith<_$ChatLoadedImpl> get copyWith =>
      __$$ChatLoadedImplCopyWithImpl<_$ChatLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) {
    return chatLoaded(listOfChat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) {
    return chatLoaded?.call(listOfChat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (chatLoaded != null) {
      return chatLoaded(listOfChat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) {
    return chatLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) {
    return chatLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (chatLoaded != null) {
      return chatLoaded(this);
    }
    return orElse();
  }
}

abstract class _ChatLoaded implements DoctorChatState {
  const factory _ChatLoaded({required final List<ChatModel> listOfChat}) =
      _$ChatLoadedImpl;

  List<ChatModel> get listOfChat;
  @JsonKey(ignore: true)
  _$$ChatLoadedImplCopyWith<_$ChatLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatErrorImplCopyWith<$Res> {
  factory _$$ChatErrorImplCopyWith(
          _$ChatErrorImpl value, $Res Function(_$ChatErrorImpl) then) =
      __$$ChatErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ChatErrorImplCopyWithImpl<$Res>
    extends _$DoctorChatStateCopyWithImpl<$Res, _$ChatErrorImpl>
    implements _$$ChatErrorImplCopyWith<$Res> {
  __$$ChatErrorImplCopyWithImpl(
      _$ChatErrorImpl _value, $Res Function(_$ChatErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ChatErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatErrorImpl implements _ChatError {
  const _$ChatErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'DoctorChatState.chatError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatErrorImplCopyWith<_$ChatErrorImpl> get copyWith =>
      __$$ChatErrorImplCopyWithImpl<_$ChatErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) {
    return chatError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) {
    return chatError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (chatError != null) {
      return chatError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) {
    return chatError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) {
    return chatError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (chatError != null) {
      return chatError(this);
    }
    return orElse();
  }
}

abstract class _ChatError implements DoctorChatState {
  const factory _ChatError({required final String error}) = _$ChatErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ChatErrorImplCopyWith<_$ChatErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPusherEventImplCopyWith<$Res> {
  factory _$$OnPusherEventImplCopyWith(
          _$OnPusherEventImpl value, $Res Function(_$OnPusherEventImpl) then) =
      __$$OnPusherEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$OnPusherEventImplCopyWithImpl<$Res>
    extends _$DoctorChatStateCopyWithImpl<$Res, _$OnPusherEventImpl>
    implements _$$OnPusherEventImplCopyWith<$Res> {
  __$$OnPusherEventImplCopyWithImpl(
      _$OnPusherEventImpl _value, $Res Function(_$OnPusherEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$OnPusherEventImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnPusherEventImpl implements _OnPusherEvent {
  const _$OnPusherEventImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'DoctorChatState.onPusherEvent(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPusherEventImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPusherEventImplCopyWith<_$OnPusherEventImpl> get copyWith =>
      __$$OnPusherEventImplCopyWithImpl<_$OnPusherEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) sendMessage,
    required TResult Function() chatLoading,
    required TResult Function(List<ChatModel> listOfChat) chatLoaded,
    required TResult Function(String error) chatError,
    required TResult Function(String? message) onPusherEvent,
  }) {
    return onPusherEvent(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String message)? sendMessage,
    TResult? Function()? chatLoading,
    TResult? Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult? Function(String error)? chatError,
    TResult? Function(String? message)? onPusherEvent,
  }) {
    return onPusherEvent?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? sendMessage,
    TResult Function()? chatLoading,
    TResult Function(List<ChatModel> listOfChat)? chatLoaded,
    TResult Function(String error)? chatError,
    TResult Function(String? message)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (onPusherEvent != null) {
      return onPusherEvent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_ChatLoading value) chatLoading,
    required TResult Function(_ChatLoaded value) chatLoaded,
    required TResult Function(_ChatError value) chatError,
    required TResult Function(_OnPusherEvent value) onPusherEvent,
  }) {
    return onPusherEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_ChatLoading value)? chatLoading,
    TResult? Function(_ChatLoaded value)? chatLoaded,
    TResult? Function(_ChatError value)? chatError,
    TResult? Function(_OnPusherEvent value)? onPusherEvent,
  }) {
    return onPusherEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_ChatLoading value)? chatLoading,
    TResult Function(_ChatLoaded value)? chatLoaded,
    TResult Function(_ChatError value)? chatError,
    TResult Function(_OnPusherEvent value)? onPusherEvent,
    required TResult orElse(),
  }) {
    if (onPusherEvent != null) {
      return onPusherEvent(this);
    }
    return orElse();
  }
}

abstract class _OnPusherEvent implements DoctorChatState {
  const factory _OnPusherEvent({final String? message}) = _$OnPusherEventImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$OnPusherEventImplCopyWith<_$OnPusherEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
